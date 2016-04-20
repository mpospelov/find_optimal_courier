class StartDateLessThanEndDateValitator < ActiveModel::Validator
  def validate(record)
    return if record.start_date.blank? || record.end_date.blank?
    return if record.start_date <= record.end_date

    record.errors.add(:start_date, :greater_than, count: record.end_date)
  end
end
