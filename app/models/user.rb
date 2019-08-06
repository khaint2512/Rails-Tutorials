class User < ApplicationRecord
  attr_accessor :remember_token
  before_save {email.downcase!}

  validates :name,  presence: true, length: { maximum: Settings.user.name.max_length }
  validates :password, presence: true, length: { minimum: Settings.user.password.min_length }
  VALID_EMAIL_REGEX = Settings.user.email.regex_valid
  validates :email, presence: true, length: { maximum: Settings.user.email.max_length }, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }

  has_secure_password

  def User.digest string
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create string, cost: cost
  end

  def User.new_token
    SecureRandom.urlsafe_base64
  end

  def remember
    self.remember_token = User.new_token
    update remember_digest: User.digest(remember_token)
  end

  def authenticated? remember_token
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password? remember_token
  end

  def forget
    update remember_digest: nil
  end
end
