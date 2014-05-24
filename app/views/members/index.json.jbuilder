json.array!(@members) do |member|
  json.extract! member, :id, :email, :password, :name, :student_id, :phone, :status
  json.url member_url(member, format: :json)
end
