class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

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

    # @product = Product.new(params[:product])

    # if @product.save
    #   redirect_to product_path(@product)
    # else
    #   render :new
    # end
  end
end



