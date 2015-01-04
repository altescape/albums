class AddAlbumCollectionToAlbums < ActiveRecord::Migration
  def change
    add_reference :albums, :albumCollection, index: true
  end
end
