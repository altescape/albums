class RemovePosition5FromAlbums < ActiveRecord::Migration
  def change
    remove_column :albums, :position5, :integer
  end
end
