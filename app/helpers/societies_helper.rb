module SocietiesHelper
  
  def locked?(f)
    ["President","Treasurer","Representative"].include?(f.object.role)
  end
  
  def admin?
    Join.find_by_member_id_and_society_id(current_member.id, current_society.id).admin
  end
      
  def link_to_remove_member(name, f)
    f.hidden_field(:_destroy) + link_to_function(name, "remove_fields(this)")
  end
  
  def link_to_add_member(name, f)
    @join = f.object.joins.new    
    @join.build_member unless @join.member
    fields = f.fields_for("joins", @join, :child_index => "new_join") do |builder|
      render("join_fields", :f => builder)
    end
    link_to_function(name, "add_fields(this, \"join\", \"#{escape_javascript(fields)}\")")
  end
  
end
