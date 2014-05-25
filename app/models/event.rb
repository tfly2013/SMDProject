class Event < ActiveRecord::Base
  self.inheritance_column = nil
  
  belongs_to :society
  has_one :ticket
  has_many :pictures
  has_many :comments
  has_many :reservations
  has_one :group
     
  accepts_nested_attributes_for :pictures, allow_destroy: true
  accepts_nested_attributes_for :group
  accepts_nested_attributes_for :ticket
        
  validates :name, length: { maximum: 30 }, presence: true, uniqueness: { case_sensitive: false }
  validates :type, length: { maximum: 15 }, presence: true

  validates_date :date_begin, presence: true, :on_or_after => lambda { Time.now.to_date }
  validates :date_end, presence: true
  validates :time_begin, presence: true
  validates :time_end, presence: true
  validates :location, presence: true
  validates :description, length: { maximum: 500 }
  
end
