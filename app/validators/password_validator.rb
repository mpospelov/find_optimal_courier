class PasswordValidator < ActiveModel::Validator
  MIN_LENGTH = 6
  MAX_LENGTH = 20

  def validate(record)
    case
    when record.password.blank?
      record.errors.add(:password, :blank)
    when record.password.length < MIN_LENGTH
      record.errors.add(:password, :too_short, count: MIN_LENGTH)
    when record.password.length > MAX_LENGTH
      record.errors.add(:password, :too_long, count: MAX_LENGTH)
    end
  end
end
