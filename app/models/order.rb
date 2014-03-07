class Order < ActiveRecord::Base
  belongs_to :user
  has_many :products, through: :order_products
  has_many :order_products
  has_one :purchase_info


  def same_address?
    if same_address 
      first_name = billing_first
      last_name  = billing_last
      address    = billing_address
      address2   = billing_address2
      city       = billing_city
      state      = billing_state
      zip_code   = billing_zip_code
    end
  end
end

