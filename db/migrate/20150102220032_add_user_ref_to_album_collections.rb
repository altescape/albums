class AddUserRefToAlbumCollections < ActiveRecord::Migration
  def change
    add_reference :album_collections, :user, index: true
  end
end
