class Order < ActiveRecord::Base
  validates :quantity, presence: true, numericality: { greater_than: 0 }
  belongs_to :user
  has_many :products, through: :order_products
end
