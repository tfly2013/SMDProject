class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def logged_in?
    !session[:member_id].nil?
  end
  
  def require_login
    if !logged_in? 
      redirect_to login_path
    end
  end

  def current_member
    if (!session[:member_id].nil?)
      return Member.find(session[:member_id])
    end    
  end
end
