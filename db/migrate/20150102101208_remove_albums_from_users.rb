class RemoveAlbumsFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :albums, :integer
  end
end
