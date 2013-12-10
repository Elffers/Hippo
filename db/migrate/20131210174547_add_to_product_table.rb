class AddToProductTable < ActiveRecord::Migration
  def change
    add_column :products, :description, :text
    add_column :products, :retired, :boolean
    add_column :products, :inventory, :integer
  end
end
