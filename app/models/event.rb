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
  validates :type, length: { maximum: 30 }, presence: true

  validates_date :date_begin, presence: true, :on_or_after => lambda { Date.current }
  validates_date :date_end, presence: true, :on_or_after => :date_begin
  validates_time :time_begin, presence: true
  validates_time :time_end, presence: true, :on_or_after => :time_begin
  validates :location, presence: true
  validates :description, length: { maximum: 500 }  
  
  def expire?
    dt_end = DateTime.new(date_end.year, date_end.month, date_end.day, time_end.hour, time_end.min, time_end.sec)
    return dt_end < Time.now
  end
end
