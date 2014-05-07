json.array!(@events) do |event|
  json.extract! event, :id, :society_id, :group_id, :name, :type, :time, :location, :webpage, :condition, :description, :status, :string
  json.url event_url(event, format: :json)
end
