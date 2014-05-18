json.array!(@reservations) do |reservation|
  json.extract! reservation, :id, :member_id, :ticket_id, :quantity, :status
  json.url reservation_url(reservation, format: :json)
end
