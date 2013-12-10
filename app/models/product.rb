class Product < ActiveRecord::Base
  belongs_to :merchant
  # validates :name #unique...method
  has_many :categories, through: :category_products
  has_many :category_products
end
