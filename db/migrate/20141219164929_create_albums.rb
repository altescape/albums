class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :name
      t.string :band
      t.string :image
      t.integer :position1
      t.integer :position2
      t.integer :position3
      t.integer :position4
      t.integer :position5
      t.integer :totalPositions

      t.timestamps
    end
  end
end
