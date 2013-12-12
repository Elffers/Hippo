class OrderProduct < ActiveRecord::Base
validates :quantity, presence: true, numericality: { greater_than: 0 }#, { only_integer: true }
  belongs_to :order
  belongs_to :product

end
