class OrdersController < ApplicationController
  
  def new
    @order = Order.new
  end

  def create
  end

  def edit
  end

  def update
  end

  def index
  end

  def show
    # @order = Order.find(params[:id])
    @order = current_order
  end
  
  def add_product
    # @product = Product.find(params[:product_id])
    @orderproduct = OrderProduct.new(order_id: current_order.id, product_id: params[:product_id])
    # @orderproduct.save
    @products = showproducts #we might want to change this. Product.last.name
      if @orderproduct.save
      # if current_order  
      # else
      #   true
      # end
      redirect_to order_path(current_order) #changes url
    else 
      flash.now[:notice] = "There was a problem adding this item to the cart." #render doesn't show notice b/c next page thing
      render :"/product/show"      
    end
  end


private

  def showproducts #we actually want this in the HTML
    current_order.products.map do |product|
      [product.name]
    end
  end
    # def orderproduct_params
  #   params.require(:order_products).permit(:order_id, :product_id, :quantity)
  # end

end


