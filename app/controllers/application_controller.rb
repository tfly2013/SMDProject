class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def logged_in?
    !session[:member].nil?
  end

  def current_member
    @current_member ||= session[:member]
  end
  
end
