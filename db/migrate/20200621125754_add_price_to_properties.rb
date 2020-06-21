class AddPriceToProperties < ActiveRecord::Migration[6.0]
  def change
    add_column :properties, :price, :float
    add_column :properties, :city, :string
    add_column :properties, :country, :string
  end
end
