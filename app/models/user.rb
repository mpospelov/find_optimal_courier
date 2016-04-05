class User < ActiveRecord::Base
  has_many :trips

  def password=(password)
    @password = password
    self.encrypted_password = PasswordEncryptor.encrypt(password)
  end
end
