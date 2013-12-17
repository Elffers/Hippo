class OrdersController < ApplicationController
  before_action :set_order, except: [:new, :create]
  before_action :set_products, only: [:show, :add_product]
  before_action :check_order, only: [:add_product]

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
    @orderproduct = OrderProduct.new 
  end
  
  def add_product
    if check_order
      flash[:notice] = "You already have this product in your cart!"
      redirect_to order_path(current_order)
    else 
    @product = Product.find(params[:product_id])
    @orderproduct = OrderProduct.new(
      order_id: current_order.id, 
      product_id: params[:product_id], 
      quantity: params[:quantity])
      if @orderproduct.save
        redirect_to order_path(current_order) #changes url
      else 
        flash.now[:notice] = "There was a problem adding this item to the cart." #render doesn't show notice b/c generates page first
        render :show
      end
    end
  end

  def remove_product
    @orderproduct = OrderProduct.find_by(order_id: current_order.id, product_id: params[:product_id])
    @orderproduct.destroy
    redirect_to order_path(current_order)
    #render :show?
  end

  def update_quantity
    @orderproduct = OrderProduct.find_by(order_id: current_order.id, product_id: params[:product_id])
    if @orderproduct.update(quantity:params[:quantity])
      redirect_to order_path(current_order)
    else
      flash.now[:notice] = "There was problem updating your order." #render doesn't show notice b/c generates page first
      render :show
    end
  end


  def checkout
  end

  def submit
   current_order.update(status:params[:payment_method])
   #Here, alert each user in Order.products.each do {|x| find the user associated w/product and alert them} 
  end


private

  def check_order
   @product = Product.find(params[:product_id])
   OrderProduct.find_by(product_id: @product.id, order_id: current_order.id).present?
  end
  
  def set_order
    @order = current_order 
  end

  def set_products
    @products = current_order.products  #this returns objects-- iterate in HTML
  end
end


