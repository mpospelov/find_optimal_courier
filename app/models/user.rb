class User < ActiveRecord::Base
  COMMON = 'common'.freeze
  MANAGER = 'manager'.freeze
  ADMIN = 'admin'.freeze
  attr_reader :password

  has_many :trips, dependent: :destroy
  has_many :solutions, dependent: :destroy

  def password=(password)
    @password = password
    self.encrypted_password = PasswordEncryptor.encrypt(password)
  end

  def admin?
    role == ADMIN
  end

  def manager?
    role == MANAGER
  end
end
