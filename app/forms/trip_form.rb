class TripForm < BaseForm
  property :destination
  property :start_date
  property :end_date
  property :comment

  validates :destination, :start_date, :end_date, presence: true
  validates_with StartDateLessThanEndDateValitator
end
