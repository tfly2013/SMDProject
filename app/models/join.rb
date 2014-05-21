class Join < ActiveRecord::Base
  belongs_to :member
  belongs_to :society
  accepts_nested_attributes_for :member
  
  validates_uniqueness_of :member_id, :scope => :society_id
  validates :role, presence: true
  before_validation :bv
  
  def bv
    if new_member = Member.find_by_email(member.email)
      self.member = new_member
    else
      self.member.save!
    end
  end

end
