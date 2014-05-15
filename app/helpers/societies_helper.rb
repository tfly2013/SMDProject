module SocietiesHelper
  
  def locked?(f)
    ["President","Treasurer"].include?(f.object.role)
  end
end
