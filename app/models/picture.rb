class Picture < ActiveRecord::Base
  belongs_to :event
  
  has_attached_file :picture, styles: { medium: "200x200>" }, :default_url => "/images/missing.png"
end
