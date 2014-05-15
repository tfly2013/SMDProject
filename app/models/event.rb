class Event < ActiveRecord::Base
  belongs_to :society
  has_one :group
  has_many :pictures
  has_many :tickets
  has_many :comments
  validates :name, length: { maximum: 30 }, presence: true, uniqueness: { case_sensitive: false }
  validates :type, length: { maximum: 15 }, presence: true
  validates :time, presence: true
  validates :location, presence: true
  validates :description, length: { maximum: 200 }
  validates :status, presence: true
end
