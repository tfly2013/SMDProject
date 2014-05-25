class Society < ActiveRecord::Base
  has_many :joins
  has_many :events
  has_many :bearers
  has_many :members, through: :joins
  has_and_belongs_to_many :groups
  
  accepts_nested_attributes_for :joins, allow_destroy: true,
                      reject_if: proc { |attributes| attributes['role'].blank? }
  
  has_attached_file :logo, styles: { medium: "200x200>", small: "150x150>" }, 
                  default_url: "/images/missing_:style.png", 
                  preserve_files: true
  
  validates_attachment_content_type :logo, content_type: ['image/jpeg', 'image/jpg', 'image/png']
  validates_attachment_size :logo, :less_than => 4.megabytes
  
  validates :name, length: { maximum: 30 }, presence: true, uniqueness: { case_sensitive: false }
  validates :register_num, length: { is: 8 }, numericality: { only_integer: true }
  validates :description, length: { maximum: 500 }
end
