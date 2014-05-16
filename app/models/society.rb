class Society < ActiveRecord::Base
  has_many :joins
  has_many :events
  has_many :bearers
  has_many :members, through: :joins
  has_and_belongs_to_many :groups
  
  accepts_nested_attributes_for :joins, reject_if: proc { |attributes| attributes['role'].blank? }
  
  validates :name, length: { maximum: 30 }, presence: true, uniqueness: { case_sensitive: false }
  validates :register_num, length: { is: 8 }, numericality: { only_integer: true }
  validates :description, length: { maximum: 100 }
end
