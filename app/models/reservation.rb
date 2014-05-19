class Reservation < ActiveRecord::Base
  belongs_to :member
  belongs_to :event
  validates :quantity, presence: true, :inclusion => { :in => 1..4, :message => "must be between 1 and 4" }
  
end
