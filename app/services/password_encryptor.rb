class PasswordEncryptor
  def self.encrypt(password)
    BCrypt::Password.create(password)
  end

  def self.decrypt(hash)
    BCrypt::Password.new(hash)
  end
end
