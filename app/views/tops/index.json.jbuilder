json.array!(@tops) do |top|
  json.extract! top, :id, :title, :tags, :category, :user_id, :items
  json.url top_url(top, format: :json)
end
