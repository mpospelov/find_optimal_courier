class EmailValidator < ActiveModel::Validator
  EMAIL_REGEXP = /\A[^@\s]+@([^@\s]+\.)+[^@\W]+\z/

  def validate(record)
    case
    when record.email.blank?
      record.errors.add(:email, :blank)
    when !record.email.match(EMAIL_REGEXP)
      record.errors.add(:email, :invalid)
    end
  end
end
