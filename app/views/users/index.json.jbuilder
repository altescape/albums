json.array!(@users) do |user|
  json.extract! user, :id, :id, :name, :email, :image, :password, :albumCollectionId
  json.url user_url(user, format: :json)
end
