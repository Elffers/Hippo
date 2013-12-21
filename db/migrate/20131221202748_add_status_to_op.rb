class AddStatusToOp < ActiveRecord::Migration
  def change
    add_column :order_products, :status, :string, default: "pending"
  end
end
