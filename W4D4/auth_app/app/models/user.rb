require 'bcrypt'

class User < ActiveRecord::Base
  before_validation :ensure_session_token

  validates :username, :password_digest, :session_token, presence: true
  validates :username, uniqueness: true
  validates :password, length: { minimum: 6, allow_nil: true }
  validate :password_cannot_be_username

  attr_reader :password

  def self.find_by_credentials(username, pw)
    debugger
    user = User.find_by(username: username)
    if BCrypt::Password.new(user.password_digest).is_password?(pw)
      return user
    else
      nil
    end
  end


  def self.generate_session_token
    SecureRandom::urlsafe_base64
  end


  def reset_session_token!
    self.session_token = User.generate_session_token
    self.save!
    self.session_token
  end

  def ensure_session_token
    self.session_token ||= User.generate_session_token
  end

  def revoke_session_token
    self.session_token = nil
    self.save!
  end

  def password=(pw)
    @password = pw
    self.password_digest = BCrypt::Password.create(pw)
  end

  private

  def password_cannot_be_username
    if BCrypt::Password.new(self.password_digest).is_password?(self.username)
      raise self.errors[:base] << "Username and password cannot be the same"
    end
  end
end
