class Event < ActiveRecord::Base
  self.inheritance_column = nil
  
  belongs_to :society
  has_one :group
  has_many :pictures
  has_many :tickets
  has_many :comments
  
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  # Validate content type
    validates_attachment_content_type :avatar, :content_type => /\Aimage/
  # Validate filename
    validates_attachment_file_name :avatar, :matches => [/png\Z/, /jpe?g\Z/]
  # Explicitly do not validate
    do_not_validate_attachment_file_type :avatar
  
  validates :name, length: { maximum: 30 }, presence: true, uniqueness: { case_sensitive: false }
  validates :type, length: { maximum: 15 }, presence: true
  validates :begin_time, presence: true
  validates :end_time, presence: true
  validates :location, presence: true
  validates :description, length: { maximum: 200 }
  validates :status, presence: true
end