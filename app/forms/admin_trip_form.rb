class AdminTripForm < BaseForm
  property :destination
  property :start_date
  property :end_date
  property :comment
  property :user_id

  validates :user_id, presence: true
  validates :destination, :start_date, :end_date, presence: true
  validates_with StartDateLessThanEndDateValitator
end
