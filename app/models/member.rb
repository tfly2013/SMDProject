class Member < ActiveRecord::Base
  has_many :joins
  has_many :societies, through: :joins
  has_many :comments
end
