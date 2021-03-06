# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  first_name             :string(255)
#  last_name              :string(255)
#  id_number              :integer
#  date_of_birth          :date
#  email                  :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#  password_digest        :string(255)
#  country                :string(255)
#  street_address         :string(255)
#  city                   :string(255)
#  state                  :string(255)
#  zip_code               :string(255)
#  phone_number           :string(255)
#  remember_token         :string(255)
#  password_reset_token   :string(255)
#  password_reset_sent_at :datetime
#  confirmed              :boolean          default(FALSE)
#  confirmation_token     :string(255)
#

class User < ActiveRecord::Base
  include PgSearch
  rolify

  has_many :events_users
  has_many :events, :through => :events_users
  has_and_belongs_to_many :competitions

  has_many :display_events_users
  has_many :display_events, :through => :display_events_users

  has_secure_password

  before_save { email.downcase! }

  validates :first_name, :last_name, :email, :country, :street_address,
            :city, :state, :zip_code, :phone_number, presence: true
  validates_date :date_of_birth, :on_or_before => lambda { Date.current }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, format: { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 6 }

  pg_search_scope :search, against: [[:last_name, 'A'], [:first_name, 'A'], [:email, 'A'], [:phone_number, 'B'], [:street_address, 'C']],
                           using: {tsearch: {prefix: true, normalization: 2}}

  class << self
    def to_json(users)
      users.collect { |user| user.to_json }
    end

    def contestant_to_json(event)
      # TODO(mark): Find a better way to consolidate these .to_json calls
      event.contestants.collect { |contestant| contestant.contestant_to_json(event.id) }.sort_by { |contestant| contestant[:rank] || Float::INFINITY }
    end

    def all
      if self.to_s == 'User'
        super
      else
        User.with_role(self.to_s.downcase)
      end
    end
  end

  def name
    "#{first_name} #{last_name}"
  end

  def to_json
    return {
      encid: id,
      first_name: first_name,
      last_name: last_name,
      country: country
    }
  end

  def contestant_to_json(event_id)
    user_to_json = to_json
    event_user = events_users.find_by_event_id(event_id)
    user_to_json[:rank] = event_user.rank
    return user_to_json
  end

  def has_admin_dashboard_access?
    has_role?(:admin) || has_role?(:website_admin) || has_role?(:super_user)
  end

  def is_admin?
    has_role?(:admin) || has_role?(:super_user)
  end

  def is_contestant?
    has_role?(:contestant)
  end

  def roles_list
    roles.collect { |role| role.name.gsub("_", " ").split.map(&:capitalize).join(" ") }.flatten.join(", ")
  end

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  def send_password_reset
    generate_password_reset_token
    self.password_reset_sent_at = Time.zone.now
    save(validate: false)
    UserMailer.password_reset(self).deliver
  end

  def clear_password_reset_token
    self.password_reset_token = nil
    self.password_reset_sent_at = nil
    save(validate: false)
  end

  def send_confirmation
    generate_confirmation_token
    save(validate: false)
    UserMailer.confirmation(self).deliver
  end

  def event_ids= event_ids
    self.events =  Event.find(event_ids)
  end

  def has_display_event(display_event)
    return display_events.where(id: display_event.id).count > 0
  end


  private

    def create_remember_token
      self.remember_token = User.encrypt(User.new_remember_token)
    end

    def generate_password_reset_token
      begin
        self.password_reset_token = SecureRandom.urlsafe_base64
      end while User.exists?(password_reset_token: self.password_reset_token)
    end

    def generate_confirmation_token
      begin
        self.confirmation_token = SecureRandom.urlsafe_base64
      end while User.exists?(confirmation_token: self.confirmation_token)
    end
end
