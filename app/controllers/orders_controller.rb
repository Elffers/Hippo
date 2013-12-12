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
    @order = Order.find(params[:id])
  end
  
  def add_product
    if :current_order
      @current_order.products << params[:product] #maybe?
    else
      true
    end


    #this needs to add a product to the order. it is a button on the product show page

  end

end

