json.array!(@societies) do |society|
  json.extract! society, :id, :name, :register_num, :website, :description
  json.url society_url(society, format: :json)
end
