module ApplicationHelper
  
  def logged_in?
    !session[:member_id].nil?
  end

  def current_member
    if (!session[:member_id].nil?)
      return Member.find(session[:member_id])
    end     
  end
  
  def unread_message_count
      current_member.received_message.where(read: false).count
  end
end
