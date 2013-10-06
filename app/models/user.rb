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
#  country         :string(255)
#  street_address  :string(255)
#  city            :string(255)
#  state           :string(255)
#  zip_code        :string(255)
#  phone_number    :string(255)
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
  validates :country, presence: true
  validates :street_address, presence: true
  validates :city, presence:true
  validates :state, presence:true
  validates :zip_code, presence:true
  validates :phone_number, presence:true
  validates :password, length: { minimum: 6 }

end
