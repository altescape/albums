class AddAlbumCollectionToUsers < ActiveRecord::Migration
  def change
    add_column :users, :album_collection, :integer
  end
end
