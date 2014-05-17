class Event < ActiveRecord::Base
  self.inheritance_column = nil
  
  belongs_to :society
  has_one :group
  has_many :pictures
  has_many :tickets
  has_many :comments
  
  has_attached_file :avatar, :styles => { :medium => "200x200>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment :avatar, :presence => true, :content_type => { :content_type => "image/png" }, :size => { :in => 0..100.kilobytes }
  
  validates :name, length: { maximum: 30 }, presence: true, uniqueness: { case_sensitive: false }
  validates :type, length: { maximum: 15 }, presence: true
  validates :begin_time, presence: true
  validates :end_time, presence: true
  validates :location, presence: true
  validates :description, length: { maximum: 200 }
  validates :status, presence: true
end