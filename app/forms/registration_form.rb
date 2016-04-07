class RegistrationForm < BaseForm
  property :email
  property :password, virtual: true

  validate :uniq_email_validation
  validates_with EmailValidator
  validates_with PasswordValidator

  private

  def save_model
    User.transaction do
      model.password = password
      model.role = User::COMMON
      super
    end
  end

  def uniq_email_validation
    return if email.blank?
    return unless User.where('lower(email) = ?', email.downcase)
                  .where.not(id: model.id).exists?
    errors.add(:email, :taken)
  end
end
