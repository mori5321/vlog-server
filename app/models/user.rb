class User < ApplicationRecord
  has_secure_token
  has_secure_password

  include BCrypt

  def authenticated?(password)
    bcrypt = BCrypt::Password.new(password_digest)
    bcrypt == password
  end
end
