json.array!(@tops) do |top|
  json.extract! top, :id, :title, :tags, :category, :user_id, :user, :items, :forked_top_id, :created_at, :updated_at
end
