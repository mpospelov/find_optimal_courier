class UserUniqEmailValidator < ActiveModel::Validator
  def validate(record)
    return if record.email.blank?
    return unless email_already_exists?(record)
    record.errors.add(:email, :taken)
  end

  private

  def email_already_exists?(record)
    User.where('lower(email) = ?', record.email.downcase).where.not(id: record.id).exists?
  end
end
