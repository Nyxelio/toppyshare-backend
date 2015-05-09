json.array!(@users) do |user|
  json.extract! user, :id, :name, :password, :mail, :lang, :country, :categories
  json.edit_url edit_user_url(user)
  #json.edit_url edit_user_url(user) if current_user.admin?
  json.tops user.tops, :id, :title, :tags, :category, :items
end
