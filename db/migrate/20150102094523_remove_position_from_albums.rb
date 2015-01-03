class RemovePositionFromAlbums < ActiveRecord::Migration
  def change
    remove_column :albums, :position, :integer
  end
end
