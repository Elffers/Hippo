class CategoryController < ApplicationController
  def new
    require_login
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    @category.save
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
