class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: "You are now a hippo!"
    else
      render :new, notice: "There was a problem saving this user! :("
    end
  end

  def update
  end

  def edit
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
  end

  # def list_item
  #   User.products
  #   # product = Product.create
  #   params[:user][:products] = [product]
  # end

  # def products
  #   Products.where user_id:id 
  # end

  def search
    @users = User.where name: params[:name]
    render :index
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
