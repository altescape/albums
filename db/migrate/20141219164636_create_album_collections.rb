class CreateAlbumCollections < ActiveRecord::Migration
  def change
    create_table :album_collections do |t|
      t.string :name
      t.string :albums

      t.timestamps
    end
  end
end
