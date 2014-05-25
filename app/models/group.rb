class Group < ActiveRecord::Base
  has_and_belongs_to_many :societies
  belongs_to :event
  
  attr_accessor :societylist
  
  after_save :add_societies
  
  def add_societies
    unless self.societylist.nil?
      society_names = societylist.split(", ")
      society_names.each do |name|
        society = Society.find_by_name(name)
        self.societies << society
      end
    end
  end
end
