class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  helper_method :current_user
  protect_from_forgery with: :exception
  before_action :authenticate

  def authenticate

  end

  def current_user
    @current_user ||= User.find(session[:user]) if session[:user]
  end
end
