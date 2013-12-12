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
    @user = Order.find(params[:id])
  end
  
  def add_product
    
  end

end
