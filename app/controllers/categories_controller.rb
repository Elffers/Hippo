class CategoriesController < ApplicationController
  def new
    require_login
    @category = Category.new
    #@product = Product.find(params[:product_id]) 
  end

  def create
    #@product = Product.find(params[:product_id])
    @category = Category.new(category_params)
    @category.save
    #redirect_to edit_product_path(@product.id) 
    #needs some way to remember which product 
    #you were editing at the time you wanted to create this new category
  end

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
    @products = Product.all
  end

  private
  def category_params
    params.require(:category).permit(:name)
  end
end
