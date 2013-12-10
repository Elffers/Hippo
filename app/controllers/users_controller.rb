class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    # unless params[:user][:email] && params[:user][:password] && params[:user][:password_confirmation]
    #   flash.now.alert = "You did not fill out all the fields!"
    #   render "new"
    # end

    @user = User.new()
    @user.email = params[:user][:email] 
    @user.password = params[:user][:password]
    @user.password_confirmation = params[:user][:password_confirmation] 

    if @user.save
      redirect_to @user, notice: "You are now a hippo!"
    else
      flash.now.alert = "There was a problem saving this user! :("
      render "new"
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
