class RemovePosition4FromAlbums < ActiveRecord::Migration
  def change
    remove_column :albums, :position4, :integer
  end
end
