class AddImageColumn < ActiveRecord::Migration
  def change
    add_column :products, :photo, :text
  end
end
