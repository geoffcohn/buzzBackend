json.array!(@users) do |user|
  json.extract! user, :id, :username, :phone_number, :tokens
  json.url user_url(user, format: :json)
end
