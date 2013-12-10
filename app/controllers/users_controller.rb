class UsersController < ApplicationController
  def create
    @user = User.new
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
