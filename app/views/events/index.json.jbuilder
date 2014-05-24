json.array!(@events) do |event|
  json.extract! event, :id, :society_id, :group_id, :name, :type, :begin_time, :end_time, :location, :webpage, :condition, :description, :status, :string
  json.url event_url(event, format: :json)
end
