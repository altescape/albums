json.array!(@album_collections) do |album_collection|
  json.extract! album_collection, :id, :id, :name, :albums
  json.url album_collection_url(album_collection, format: :json)
end
