class RemovePosition3FromAlbums < ActiveRecord::Migration
  def change
    remove_column :albums, :position3, :integer
  end
end
