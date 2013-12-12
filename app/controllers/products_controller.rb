class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

# All of these below should only be accessible if the user is signed in

  def new
    @product = Product.new #(user_id: params[:user_id])
  end

  def edit   
    @product = Product.find(params[:id]) 
  end

  def create
    @product = Product.new(product_params)  #User_id might be a security issue, (ask bookis?)
    if @product.save
      redirect_to products_path
    else
      render :new
    end
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to products_path
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])  
    @product.destroy
    redirect_to products_path  
  end
end

private

def product_params
  params.require(:product).permit(:name, :price, :user_id, :inventory, :description, :retired)
end



