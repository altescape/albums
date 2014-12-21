json.array!(@albums) do |album|
  json.extract! album, :id, :id, :name, :band, :image, :position1, :position2, :position3, :position4, :position5, :totalPositions
  json.url album_url(album, format: :json)
end
