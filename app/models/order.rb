class Order < ActiveRecord::Base
  belongs_to :user
  has_many :products, through: :order_products
end
