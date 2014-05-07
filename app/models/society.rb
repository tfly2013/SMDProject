class Society < ActiveRecord::Base
  validates :name, length: { maximum: 30 }, presence: true, uniqueness: { case_sensitive: false }
  validates :register_num, length: { is: 8 }, numericality: { only_integer: true }
  validates :description, length: { maximum: 100 }
end
