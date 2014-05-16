class Member < ActiveRecord::Base
  has_many :joins
  has_many :societies, through: :joins
  has_many :comments
  has_secure_password
  
  accepts_nested_attributes_for :joins, reject_if: proc { |attributes| attributes['role'].blank? }
  
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  validates :email, presence: true,
                    format: { with: email_regex },
                    uniqueness: { case_sensitive: false },
                    on: :create
  
  validates :password, length: { minimum: 6 }, 
                       allow_nil: true,
                       on: :create
                       
  validates :name, length: { maximum: 30 }
  
  validates :student_id, length: { maximum: 6 }
  
  validates :phone, length: { maximum: 13 } 
end
