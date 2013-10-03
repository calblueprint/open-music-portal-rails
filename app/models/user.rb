class User < ActiveRecord::Base
	before_save { self.email = email.downcase }
	validates(:first_name, presence: true, length: { minimum: 1 })
	validates(:last_name, presence: true, length: { minimum: 1 })
	validates_inclusion_of :age, in: 0..99
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
                   	  uniqueness: { case_sensitive: false }
    has_secure_password
    validates :password, length: { minimum: 6 }

end