class PasswordCheckerService
  def initialize(user)
    @user = user
  end

  def valid_password?(password)
    encrypted_password = @user.encrypted_password
    encrypted_password.present? && PasswordEncryptor.decrypt(encrypted_password) == password
  end
end
