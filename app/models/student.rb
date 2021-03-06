class Student < ApplicationRecord
    before_save { self.email = email.downcase }
    validates :name, presence: true, length: { maximum: 50}
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 200 },
    format: { with: VALID_EMAIL_REGEX },
    uniqueness: { case_sensitive: false }
    validates :address, presence: true, length: { maximum: 399 }
    validates :phone_number, presence: true, length: { maximum: 11 },
    uniqueness: true
    has_secure_password
    validates :password, presence: true, length: { minimum: 6 }
end
