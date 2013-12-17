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
    if current_user
      @product = Product.new(product_params)
      @product.save
      redirect_to "/products/#{@product.id}", notice: "You have successfully listed this product!"
    else
      redirect_to sign_in_path, notice: "You must sign in to list a product!"
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

  def search_by_name
     @products = Product.where name: params[:product] 
  end


  def search
    @orderproduct = OrderProduct.new(order_id: current_order.id, product_id: params[:product_id], quantity: params[:quantity].to_i) #will be input as string
    @products = Product.where('name = ? OR description LIKE ?', params[:product], "%#{params[:product]}%" )
    if @products == []
      flash[:notice] = "No items match your search"
      redirect_to root_path
    else 
      flash[:notice] = "these are all the products named #{params[:product]}"
      render :index
    end
  end
end

private

def product_params
  params.require(:product).permit(:name, :price, :user_id, :inventory, :description, :retired)
end



