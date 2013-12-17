class CategoryProductsController < ApplicationController
  def update
    @categoryproducts = CategoryProduct.new
    @product = Product.find(params[:id])
    puts @product
    params[:product][:category].each do |category_id|
      next if category_id.to_i == 0
      category = Category.find(category_id.to_i)
      @product.categories << category
    end
    redirect_to products_path
  end

  # def update
  #   redirect_to products_path
  # end

  def destroy
    categoryproduct = CategoryProduct.where("category_id = ? AND product_id = ?", params[:id], params[:product_id]).first
    categoryproduct.destroy
    redirect_to products_path
  end
end