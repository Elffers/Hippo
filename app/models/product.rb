class Product < ActiveRecord::Base
   validates :name, :price, presence: true #unique...method
   belongs_to :merchant
   has_many :categories, through: :category_products
   has_many :category_products


end
