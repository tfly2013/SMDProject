class Join < ActiveRecord::Base
  belongs_to :member
  belongs_to :society
  accepts_nested_attributes_for :member
  
  validates_uniqueness_of :member_id, :scope => :society_id
  validates :role, presence: true
  
  before_validation :find_member_if_exist
  
  def find_member_if_exist
    if new_member = Member.find_by_email(member.email)
      self.member = new_member
    else
       self.member = member if self.member.save!
    end
  end

  def member_attributes=(member_attrs)
    self.member = Member.find_or_initialize_by_id(member_attrs.delete(:id))
    self.member.attributes = member_attrs
  end
end
