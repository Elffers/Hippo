class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      # attaches current order to newly created user
      current_order.update(user_id: @user.id)
      redirect_to root_path, notice: "You are now a hippo!"
    else
      render :new, notice: "There was a problem saving this user! :("
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id), notice: "Your profile was successfully
                                                updated!"
    else
      render :edit, notice: "There was a problem updating your profile :("
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def destroy
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @products = @user.products
    @orders = @user.orders
    # something here to update order status to complete
    @quantityarray = @products.map do |product|
      product.order_products.map do |item|
        item.quantity if item.status == "pending"
      end
    end
    # returns array of total quantity ordered per product
    @totals = @quantityarray.map do |qa|
      qa.compact.inject(:+)
    end
    @paid = @products.map do |product|
      product.order_products.where.not(status: 'pending')
    end
    @bought =  @paid.map do |a|
      a.map { |op| op.quantity }
    end
    # returns array of total quantity bought per product
    @total_bought = @bought.map { |x| x.inject(:+) }
  end

  def search
    @users = User.where name: params[:name]
    render :index
  end

  def orders
    if params[:id].to_i != session[:user_id].to_i
      flash[:notice] = "You are not authorized to view this page!"
      redirect_to user_path(params[:id])
    else
      @user = User.find(params[:id])
      @products = @user.products
      @paid = @products.map do |product|
        product.order_products.where(status: "paid")
      end
    end
  end

  def pending
    if params[:id].to_i != session[:user_id].to_i
      flash[:notice] = "You are not authorized to view this page!"
      redirect_to user_path(params[:id])
    else
      @user = User.find(params[:id])
      @products = @user.products
      @pending = @products.map do |product|
        product.order_products.where(status: "pending")
      end
    end
  end

  def completed
    if params[:id].to_i != session[:user_id].to_i
      flash[:notice] = "You are not authorized to view this page!"
      redirect_to user_path(params[:id])
    else
      @user = User.find(params[:id])
      @products = @user.products
      @completed = @products.map do |product|
        product.order_products.where(status: "shipped")
      end
    end
  end

  def ship
    @op = OrderProduct.find(params[:op_id])
    @op.update(status: "shipped")
    redirect_to user_orders_path(session[:user_id], Order.find(@op.order_id))
    # update order to shipped
  end

  private

  def user_params
    params.require(:user).permit(
                                :name,
                                :email,
                                :password,
                                :password_confirmation
    )
  end
end
