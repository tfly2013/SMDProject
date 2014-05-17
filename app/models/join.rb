class Join < ActiveRecord::Base
  belongs_to :member
  belongs_to :society
  accepts_nested_attributes_for :member,
          reject_if: proc { |attributes| attributes['email'].blank? ||
                                         attributes['name'].blank?}
                                         
  validates_uniqueness_of :member_id, :scope => :society_id
  validates :role, presence: true
end
