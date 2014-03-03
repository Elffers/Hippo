class AddColumnsToProducts < ActiveRecord::Migration
  def change
    add_column :products, :weight, :integer
    add_column :products, :height, :integer
    add_column :products, :depth, :integer
    add_column :products, :length, :integer
  end
end
