json.array!(@tickets) do |ticket|
  json.extract! ticket, :id, :event_id, :price, :purchase_location, :strat_time, :valid_time
  json.url ticket_url(ticket, format: :json)
end
