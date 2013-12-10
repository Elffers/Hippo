class UsersController < ApplicationController
  def create
    @user = User.new
    if params[:email] && params[:password] && params[:password_confirmation]
      @user.save
      redirect_to "/users/index", notice: "You are now a hippo!"
    else
      flash.now.alert = "You did not fill out all the fields!"
      render "create"
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
end
