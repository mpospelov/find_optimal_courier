class AdminTripPresenter < TripPresenter
  def to_hash(*)
    super.merge(
      user_id: represented.user_id,
      user_email: represented.user.try(:email))
  end
end
