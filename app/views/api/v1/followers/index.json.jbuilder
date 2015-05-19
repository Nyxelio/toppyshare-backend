json.array!(@followers) do |follower|
  json.extract! follower, :id, :user, :created_at, :updated_at
end
