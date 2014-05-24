class Reservation < ActiveRecord::Base
  belongs_to :member
  belongs_to :event
  validates :quantity, presence: true, inclusion: { in: 1..4, message: "must be between 1 and 4" }
  
  validate :check_ticket
  
  def check_ticket
    if self.quantity > remain_ticket(self.event)
      errors.add(:quantity, "No enough tickets.")
    end
  end
  
  def remain_ticket(event)
    remain = event.ticket.total
    event.reservations.each do |r|
      remain -= r.quantity
    end
    return remain
  end
end
