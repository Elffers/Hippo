class Category < ActiveRecord::Base
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  has_many :products, through: :category_products
end
