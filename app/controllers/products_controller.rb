class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

# All of these below should only be accessible if the user is signed in

  def new
    
  end

  def edit
    
  end

  def create
    @product = Product.new params.require(:product).permit(:name, :price, :user_id) #User_id might be a security issue, (ask bookis?)
    if @product.save
      redirect_to products_path
    else
      render :new
    end
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(params.require(:product).permit(:name, :price, :user_id))
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



