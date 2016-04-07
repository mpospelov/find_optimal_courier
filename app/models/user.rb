class User < ActiveRecord::Base
  COMMON = 'common'.freeze
  MANAGER = 'manager'.freeze
  ADMIN = 'admin'.freeze

  has_many :trips

  def password=(password)
    @password = password
    self.encrypted_password = PasswordEncryptor.encrypt(password)
  end
end
