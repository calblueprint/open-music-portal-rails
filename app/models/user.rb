# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  first_name      :string(255)
#  last_name       :string(255)
#  id_number       :integer
#  date_of_birth   :date
#  email           :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#  password_digest :string(255)
#

class User < ActiveRecord::Base
  has_secure_password

  before_save { email.downcase! }

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates_date :date_of_birth, :on_or_before => lambda { Date.current }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
             uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 6 }

  def self.to_json(users)
      return users.collect {|user| user.to_json}
    end

    def to_json
      return {
        first_name: first_name,
        last_name: last_name,
        email: email
      }
    end
end
