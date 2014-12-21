class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :image
      t.string :password
      t.integer :albumCollectionId

      t.timestamps
    end
  end
end
