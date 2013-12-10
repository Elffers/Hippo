class Product < ActiveRecord::Base
   validates :name, presence: true, uniqueness: { case_sensitive: false }
   validates :price, presence: true, numericality: { greater_than: 0 }
   validates :user_id, presence: true
   belongs_to :user
   has_many :categories, through: :category_products
   has_many :category_products


end
