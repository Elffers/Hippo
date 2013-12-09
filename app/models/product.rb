class Product < ActiveRecord::Base
  belongs_to :merchant
  validation :name #unique...method
  has_many :categories, through: :category_products
  has_many :category_products
end
