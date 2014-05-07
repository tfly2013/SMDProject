class Event < ActiveRecord::Base
  belongs_to :society
  has_one :group
  has_many :pictures
  has_many :tickets
  has_many :comments
end
