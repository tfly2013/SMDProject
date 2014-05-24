module ReservationsHelper
  
  def remain_ticket(event)
    remain = event.ticket.total
    event.reservations.each do |r|
      remain -= r.quantity
    end
    return remain
  end
end
