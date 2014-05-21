class Picture < ActiveRecord::Base
  belongs_to :event
  
  has_attached_file :picture, styles: { medium: "300x300>", small:"100x100>" }, :default_url => "/images/missing.png"
  
  validates_attachment_content_type :picture, content_type: ['image/jpeg', 'image/jpg', 'image/png']
  validates_attachment_size :picture, :less_than => 10.megabytes
end
