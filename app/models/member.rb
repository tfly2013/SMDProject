class Member < ActiveRecord::Base
  has_many :joins
  has_many :societies, through: :joins
  has_many :events, through: :societies
  has_many :reservations
  has_many :comments 
  has_many :sended_message, :class_name => "Message", :foreign_key => "sender_id"
  has_many :received_message, :class_name => "Message", :foreign_key => "receiver_id"
  has_secure_password
  
  attr_accessor :old_password, :auto_generate
   
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  validates :email, presence: true,
                    format: { with: email_regex },
                    uniqueness: { case_sensitive: false },
                    on: :create
  
  validates :password, length: { minimum: 6 }, 
                       allow_nil: true,
                       on: :create
                       
  validates :name, presence: true,
                   length: { maximum: 30 }
  
  validates :student_id, length: { maximum: 6 }
  
  validates :phone, length: { maximum: 13 } 
  
  before_validation :generate_password
    
  def generate_password
    if self.new_record? && self.auto_generate == "1"
      self.password = (0...8).map { (65 + rand(26)).chr }.join
      self.password_confirmation = self.password      
    end
  end
end
