class Group < ActiveRecord::Base
  has_one :event
  has_and_belongs_to_many :societies
end
