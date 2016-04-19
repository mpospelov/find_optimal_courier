class AdminTripForm < BaseForm
  property :destination
  property :start_date
  property :end_date
  property :comment
  property :user_id

  validates :user_id, presence: true
end
