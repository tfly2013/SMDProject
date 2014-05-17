class Join < ActiveRecord::Base
  belongs_to :member
  belongs_to :society
  accepts_nested_attributes_for :member
  
  validates_uniqueness_of :member_id, :scope => :society_id
  validates :role, presence: true
end
