class AddAlbumsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :albums, :integer
  end
end
