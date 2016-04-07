class SessionForm
  include ActiveModel::Validations

  attr_reader :email

  validates :email, presence: true

  validate :validate_user_authenticated

  def initialize(user)
    @user = user
  end

  def validate(params)
    @password = params[:password]
    @email = params[:email]
    super
  end

  def model
    @user
  end

  private

  def validate_user_authenticated
    return if @user.present? && PasswordCheckerService.new(@user).valid_password?(@password)
    errors.add(:base, 'Invalid login field or password')
  end
end
