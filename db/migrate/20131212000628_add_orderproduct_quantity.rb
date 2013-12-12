class AddOrderproductQuantity < ActiveRecord::Migration
  def change
    add_column :order_products, :quantity, :integer
  end
end
