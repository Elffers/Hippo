class CategoryProductsController < ApplicationController
  def update
    
  end

  def destroy
    categoryproduct = CategoryProduct.where("category_id = ? AND product_id = ?", params[:id], params[:product_id]).first
    categoryproduct.destroy
    redirect_to products_path
  end
end