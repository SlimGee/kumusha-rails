class CreateProperties < ActiveRecord::Migration[6.0]
  def change
    create_table :properties do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title
      t.string :address
      t.integer :units
      t.integer :bedrooms
      t.integer :dinig_rooms
      t.integer :kitchens
      t.float :yard
      t.integer :rooms
      t.text :description

      t.timestamps
    end
  end
end
