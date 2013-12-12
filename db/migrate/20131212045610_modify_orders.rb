class ModifyOrders < ActiveRecord::Migration
  def change
    remove_column :orders, :product_id
    remove_column :orders, :quantity
    remove_column :orders, :description
  end
end
