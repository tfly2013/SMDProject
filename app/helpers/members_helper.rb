module MembersHelper
  
  def manager?(member)
    member.join.role != "normal"
  end
end
