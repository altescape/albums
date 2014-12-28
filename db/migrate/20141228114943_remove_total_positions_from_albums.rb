class RemoveTotalPositionsFromAlbums < ActiveRecord::Migration
  def change
    remove_column :albums, :totalPositions, :integer
  end
end
