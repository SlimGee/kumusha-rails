class CreatePropertyImages < ActiveRecord::Migration[6.0]
  def change
    create_table :property_images do |t|
      t.string :image
      t.references :property, null: false, foreign_key: true

      t.timestamps
    end
  end
end
