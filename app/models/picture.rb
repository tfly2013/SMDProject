class Picture < ActiveRecord::Base
  belongs_to :event
  
  has_attached_file :picture, styles: { large: "600x600>", small: "150x150>" }, preserve_files: true
  
  validates_attachment_content_type :picture, content_type: ['image/jpeg', 'image/jpg', 'image/png']
  validates_attachment_size :picture, :less_than => 10.megabytes
end
