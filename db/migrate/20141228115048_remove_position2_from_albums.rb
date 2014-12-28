class RemovePosition2FromAlbums < ActiveRecord::Migration
  def change
    remove_column :albums, :position2, :integer
  end
end
