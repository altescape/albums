json.array!(@albums) do |album|
  json.extract! album, :id, :name, :band, :image, :position
  json.url album_url(album, format: :json)
end
