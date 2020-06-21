class AddTypeToProperties < ActiveRecord::Migration[6.0]
  def change
    add_column :properties, :sale_type, :string
  end
end
