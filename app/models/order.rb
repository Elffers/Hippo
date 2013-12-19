class Order < ActiveRecord::Base
  belongs_to :user
  has_many :products, through: :order_products
  has_many :order_products
  belongs_to :purchase_info
end

