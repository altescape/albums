class AddUserIdToAlbumsCollection < ActiveRecord::Migration
  def change
    add_column :album_collections, :user_id, :integer
  end
end
