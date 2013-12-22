class OrdersController < ApplicationController
  before_action :set_order, except: [:new, :create, :show] #don't want to show only current order
  before_action :set_products, only: [:add_product, :update_quantity, :checkout]
  before_action :check_order, only: [:add_product]
  before_action :totals, only: [:update_quantity, :checkout]

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
    if Order.find_by(id:params[:id]).nil?
      flash[:notice] = "This order does not exist."
      redirect_to root_path
    else
      @order = Order.find(params[:id])
      @orderproduct = OrderProduct.new 
      @products = @order.products
      @stati = @order.order_products.map {|op| op.status}
      # put a guard here to remove products from cart if you own it (happens if bought as a guest then signed in)
      unless @products == nil?
        totals
      end
    end
  end
  
  def add_product
    if check_order
      flash[:notice] = "You already have this product in your cart!"
      redirect_to order_path(current_order)
    else 
    @product = Product.find(params[:product_id])
      if @product.inventory == 0
        flash[:notice] = "This product is out of stock. Check back soon!"
        redirect_to root_path
      else
        @orderproduct = OrderProduct.new(
        order_id: current_order.id, 
        product_id: params[:product_id], 
        quantity: params[:quantity],
        status: "pending")
        if @orderproduct.save
          redirect_to order_path(current_order) #changes url
        else 
          flash.now[:notice] = "There was a problem adding this item to the cart." #render doesn't show notice b/c generates page first
          render :show
        end
      end
    end
  end

  def remove_product
    @orderproduct = OrderProduct.find_by(order_id: current_order.id, product_id: params[:product_id])
    @orderproduct.destroy
    redirect_to order_path(current_order) #why doesn't need to be current_order.id?
  end

  def update_quantity
    @orderproduct = OrderProduct.find_by(order_id: current_order.id, product_id: params[:product_id])
    if @orderproduct.update(quantity:params[:quantity])
      redirect_to order_path(current_order)
    else
      flash.now[:notice] = "There was problem updating your order."
      render :show
    end
  end

  def checkout
    @purchase_info = PurchaseInfo.new
    current_order.products.each do |product|
      if product.inventory == 0
        flash[:notice] = "We are currently out of stock. Please modify your order."
        redirect_to order_path(current_order)
      elsif OrderProduct.find_by(product_id:product.id, order_id:current_order.id).quantity > product.inventory
        flash[:notice] = "We have #{product.inventory} of those in stock. Please modify your order."
        redirect_to order_path(current_order)
      else
        product.update(inventory:product.inventory - OrderProduct.find_by(product_id:product.id, order_id:current_order.id).quantity)
      end
    end
  end

  def complete_purchase
    @purchase_info = PurchaseInfo.new(purchase_params)
    @purchase_info[:order_id] = current_order.id
    current_order.update(status: "paid")
    current_order.order_products.each do |op|
      op.update(status:"paid")
    end
    if @purchase_info.save
      flash[:notice] = "Your order is complete!"
      current_order = Order.new  #This needs to archive paid order and open a new one
      redirect_to root_path
    else
      flash[:notice] = "There was an error processing your order."
      render :checkout
    end
  end

private
  def check_user
    @order = Order.find(params[:id])
    @order.user_id == session[:user_id]
  end

  def check_order
   @product = Product.find(params[:product_id])
   OrderProduct.find_by(product_id: @product.id, order_id: current_order.id).present?
  end
  
  def set_order
    @order = current_order 
  end

  def set_products
    @products = current_order.products
  end

  def totals
    @items = current_order.order_products.map {|x| x.quantity} 
    @item_total =  @items.inject(:+)
    @subtotals = @products.map do |product|
      product.price * OrderProduct.find_by(product_id: product.id, order_id: @order.id).quantity
    end
    @total = @subtotals.reduce(:+)
  end

  def purchase_params
    params.require(:purchase_info).permit(
    :first_name,
    :last_name,
    :address,
    :address2,
    :city,
    :state,
    :zip_code,
    :billing_first,
    :billing_last,
    :credit_card_number,
    :expiration_date,
    :cvv,
    :billing_address,
    :billing_address2,
    :billing_city,
    :billing_state,
    :billing_zip_code)
  end

  helper_method :check_user

end


