class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.datetime :date
      t.references :property, null: false, foreign_key: true
      t.string :name
      t.string :phone
      t.string :email
      t.boolean :attended

      t.timestamps
    end
  end
end
