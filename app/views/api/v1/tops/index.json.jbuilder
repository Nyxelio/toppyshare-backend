json.array!(@tops) do |top|
  json.extract! top, :id, :title, :tags, :category, :user_id, :items, :created_at, :updated_at
end