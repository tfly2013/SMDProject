class Event < ActiveRecord::Base
  self.inheritance_column = nil
  
  belongs_to :society
  has_one :ticket
  has_many :pictures
  has_many :comments
  has_many :reservations
  has_and_belongs_to_many :groups
     
  accepts_nested_attributes_for :pictures, allow_destroy: true
  accepts_nested_attributes_for :groups
  accepts_nested_attributes_for :ticket
  
  validates :name, length: { maximum: 30 }, presence: true, uniqueness: { case_sensitive: false }
  validates :type, length: { maximum: 15 }, presence: true
  validates :begin_time, presence: true
  validates :end_time, presence: true
  validates :location, presence: true
  validates :description, length: { maximum: 1000 }
  validates :total, presence: true, inclusion: { in: 1..500 }
  validates :price, presence: true
end