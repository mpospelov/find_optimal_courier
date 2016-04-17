class AdminUserForm < BaseForm
  property :email
  property :role
  property :password, virtual: true

  validates_with UserUniqEmailValidator
  validates_with EmailValidator
  validates_with PasswordValidator, if: :password_present?

  def save_model
    model.password = password if password_present?
    model.role ||= User::COMMON

    super
  end

  def password_present?
    password.present?
  end
end
