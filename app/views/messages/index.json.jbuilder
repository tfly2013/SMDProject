json.array!(@messages) do |message|
  json.extract! message, :id, :content, :read
  json.url message_url(message, format: :json)
end
