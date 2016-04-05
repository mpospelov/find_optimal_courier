class UserByEmailQuery
  def initialize(email)
    @email = email
  end

  def take
    User.find_by('lower(email) = ?', @email)
  end
end
