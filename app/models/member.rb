class Member < ActiveRecord::Base
  has_many :joins
  has_many :societies, through: :joins
  has_many :comments
  
  attr_accessor :password
  
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  validates :email, presence: true,
                    format: { with: email_regex },
                    uniqueness: { case_sensitive: false }
  
  validates :password, presence: true,
                       confirmation: true,
                       length: { in: 6..40 }
                       
  validates :password_confirmation, presence: true
  
  validates :name, length: { maximum: 20 }
  
  validates :student_id, length: { maximum: 6 }
  
  validates :phone, length: { maximum: 13 } 

  before_save :encrypt_password
  
  def has_password?(submitted_password)
    encrypted_password == encrypt(submitted_password)
  end
  
  def Member.authenticate(email, submitted_password)
    member = find_by_email(email)
    return nil if member.nil?
    return member if member.has_password?(submitted_password)    
  end
    
  private
    def encrypt_password
      self.salt = make_salt if new_record?
      self.encrypted_password = encrypt(password)
    end
    
    def encrypt(string)
      secure_hash("#{salt}--#{string}")
    end
    
    def make_salt
      secure_hash("#{Time.now.utc}--#{password}")   
    end
      
    def secure_hash(string)
      Digest::SHA2.hexdigest(string)      
    end
end
