class User < ApplicationRecord
  before_save {email.downcase!}

  validates :name,  presence: true, length: { maximum: Settings.user.name.max_length }
  validates :password, presence: true, length: { minimum: Settings.user.password.min_length }
  VALID_EMAIL_REGEX = Settings.user.email.regex_valid
  validates :email, presence: true, length: { maximum: Settings.user.email.max_length }, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }

  has_secure_password
end
