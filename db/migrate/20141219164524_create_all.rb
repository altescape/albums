class CreateAll < ActiveRecord::Migration
  def up
    # Users
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password
      t.string :password_digest
      t.timestamps
    end
    add_index :users, :email, unique: true

    # Album Collections
    create_table :album_collections do |t|
      t.integer :user_id
    end
    add_index :album_collections, :user_id

    # Albums
    create_table :albums do |t|
      t.string :name
      t.string :artist
      t.string :image
      t.integer :position
      t.integer :album_collection_id
      t.timestamps
    end
    add_index :albums, :album_collection_id
  end

  def down
    drop_table :users
    drop_table :albums
    drop_table :album_collections
  end
end
