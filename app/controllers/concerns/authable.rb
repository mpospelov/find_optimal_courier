module Authable
  extend ActiveSupport::Concern

  included do
    helper_method :current_user
    helper_method :user_signed_in?
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def user_signed_in?
    current_user.present?
  end

  def sign_in(user)
    session[:user_id] = user.id
  end

  def sign_out
    session[:user_id] = nil if user_signed_in?
  end

  def authenticate_user!
    return if user_signed_in?
    fail AuthenticationError, 'authentication required'
  end

  def authenticate_admin!
    authenticate_user!
    fail AuthenticationError, 'you are not an admin' unless current_user.admin?
  end

  class AuthenticationError < StandardError; end
end
