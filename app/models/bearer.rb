class Bearer < ActiveRecord::Base
  belongs_to :society  
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  validates :role, presence: true,
                   length: { maximum: 40 }  
  
  validates :email, presence: true,
                    format: { with: email_regex },
                    uniqueness: { case_sensitive: false }
                    
  validates :name, presence: true, 
                   length: { maximum: 30 }
  
  validates :phone, length: { maximum: 13 }
end
