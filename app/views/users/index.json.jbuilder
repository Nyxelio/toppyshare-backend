json.array!(@users) do |user|
  json.extract! user, :id, :name, :password, :mail, :lang, :country, :categories
  json.url user_url(user, format: :json)
end
