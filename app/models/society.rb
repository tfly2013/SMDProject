class Society < ActiveRecord::Base
  has_many :joins
  has_many :events
  has_and_belongs_to_many :groups
  validates :name, length: { maximum: 30 }, presence: true, uniqueness: { case_sensitive: false }
  validates :register_num, length: { is: 8 }, numericality: { only_integer: true }
  validates :description, length: { maximum: 100 }
end
