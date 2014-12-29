class RemoveAlbumCollectionIdFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :albumCollectionId, :integer
  end
end
