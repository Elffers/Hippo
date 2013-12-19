class CreatePurchaseInfos < ActiveRecord::Migration
  def change
    create_table :purchase_infos do |t|
      t.integer :order_id
      t.integer :user_id
      t.string  :first_name
      t.string  :last_name
      t.string  :address
      t.string  :address2
      t.string  :city
      t.string  :state
      t.integer :zip_code
      t.string  :billing_first
      t.string  :billing_last
      t.integer :credit_card_number
      t.integer :expiration_date
      t.integer :cvv
      t.string  :billing_first
      t.string  :billing_last
      t.string  :billing_address
      t.string  :billing_address2
      t.string  :billing_city
      t.string  :billing_state
      t.integer :billing_zip_code
      t.boolean :same_address
      t.timestamps
    end
  end
end
