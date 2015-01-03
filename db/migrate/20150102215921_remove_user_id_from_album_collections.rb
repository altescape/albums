class RemoveUserIdFromAlbumCollections < ActiveRecord::Migration
  def change
    remove_column :album_collections, :user_id, :integer
  end
end
