module ApplicationHelper
  
  def logged_in?
    !session[:member].nil?
  end

  def current_member
    session[:member]
  end
  
  def current_society
    session[:society]
  end
end
