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

  def show
    @order = Order.find(params[:id])
  end
  
  def add_product
    @product = Product.find(params[:product_id])
    @orderproduct = OrderProduct.new
    @orderproduct[:order_id] = current_order.id 
    @orderproduct[:product_id] = @product.id 
    @orderproduct.save
    @products = showproducts
      if @orderproduct.save
      # if current_order  
      # else
      #   true
      # end
      render :show
    else 
      true        
    end
  end


private

  def showproducts
    current_order.products.map do |product|
      [product.name]
    end
  end
  # def orderproduct_params
  #   params.require(:order_products).permit(:order_id, :product_id, :quantity)
  # end

end


