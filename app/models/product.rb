class Product < ActiveRecord::Base

   validates :name, presence: true, uniqueness: { case_sensitive: false }
   validates :price, presence: true, numericality: { greater_than: 0 }
   validates :user_id, presence: true
   validates :description, presence: true #has photo...CarrierWave???
   validates :inventory, presence: true, numericality: { greater_than: -1 }

   belongs_to :user
   has_many :categories, through: :category_products
   has_many :category_products
   has_many :orders, through: :order_products
   has_many :reviews

end