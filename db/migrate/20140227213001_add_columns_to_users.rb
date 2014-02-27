class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :seller_address, :string
    add_column :users, :seller_address2, :string
    add_column :users, :seller_city, :string
    add_column :users, :seller_state, :string
    add_column :users, :seller_zipcode, :integer

  end
end
