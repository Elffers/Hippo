class CategoryProductsController < ApplicationController
  def update #normally called create
    @categoryproducts = CategoryProduct.new
    @product = Product.find(params[:id])
    puts @product
    params[:product][:category].each do |category_id|
      next if category_id.to_i == 0
      category = Category.find(category_id.to_i)
      @product.categories << category
    end
    redirect_to product_path(@product.id) #redirect to product show page
  end

  def destroy
    @product = Product.find(params[:product_id])
    @categoryproduct = CategoryProduct.find_by(product_id: params[:product_id], category_id:params[:id]) 
    @categoryproduct.destroy
    redirect_to product_path(@product)
  end
end