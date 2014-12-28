class RemovePosition1FromAlbums < ActiveRecord::Migration
  def change
    remove_column :albums, :position1, :integer
  end
end
