class OrdersController < ApplicationController
  
  def new
  end

  def index
  end

  def show
    @user = Order.find(params[:id])
  end

end
