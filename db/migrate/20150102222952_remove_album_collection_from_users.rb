class RemoveAlbumCollectionFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :album_collection, :integer
  end
end
