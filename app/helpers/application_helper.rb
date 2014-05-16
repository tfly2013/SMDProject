module ApplicationHelper
  
  def logged_in?
    !session[:member].nil?
  end

  def current_member
    @current_member ||= session[:member]
  end
end
