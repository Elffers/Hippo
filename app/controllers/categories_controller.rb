class CategoriesController < ApplicationController
  def new
    require_login
    @category = Category.new
    # @product = Product.find(params[:product_id])
  end

  def create
    @product = Product.find(params[:product_id])
    @category = Category.new(category_params)
    if @category.save
      CategoryProduct.create(
                            product_id: params[:product_id],
                            category_id: @category.id
                            )
      redirect_to edit_product_path(params[:product_id])
    else
      flash[:notice] = "This category already exists!"
      redirect_to new_category_path(@product)
    end
  end

  def index
    @categories = Category.all.map do |c|
      [c, c.products.count]
    end
    @top_categories = @categories.sort_by { |x| x[1] }.reverse
  end

  def show
    @category = Category.find(params[:id])
    @products = @category.products
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
