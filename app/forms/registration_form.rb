class RegistrationForm < BaseForm
  property :email
  property :password, virtual: true

  validates_with EmailValidator
  validates_with UserUniqEmailValidator
  validates_with PasswordValidator

  private

  def save_model
    model.password = password
    model.role = User::COMMON
    super
  end
end
