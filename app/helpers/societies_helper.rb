module SocietiesHelper
  
  def locked?(f)
    ["President","Treasurer"].include?(f.object.role)
  end
      
  def link_to_remove_member(name, f)
    f.hidden_field(:_destroy) + link_to_function(name, "remove_fields(this)")
  end
  
  def link_to_add_member(name, f)
    new_member = f.object.members.new
    new_member.joins.new
    fields = f.fields_for("members", new_member, :child_index => "new_member") do |builder|
      render("member_fields", :f => builder)
    end
    link_to_function(name, "add_fields(this, \"member\", \"#{escape_javascript(fields)}\")")
  end
  
end
