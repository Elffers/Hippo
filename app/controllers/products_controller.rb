# foobar
class ProductsController < ApplicationController
  before_action :set_product, except: [:new, :create]

  # def index
  #   @products = Product.all
  #   render partial: "index"
  # end

  def show
    @users = User.all
  end

  def new
    if current_user
      @product = Product.new # (user_id: params[:user_id])
    else
      redirect_to sign_in_path, notice: "You must sign in to list a product!"
    end
  end

  def create
    @product = Product.new(product_params)
    # Following would be unnecessary if route was renamed RESTfully
    @product[:user_id] = current_user.id
    if @product.save
      redirect_to "/products/#{@product.id}", notice: "You have successfully
                                                      listed this product!"
    else
      # new_product_path
      redirect_to "/products/new", notice: "There was an error, try again."
    end
  end

  def edit
    if @product.user_id != session[:user_id]
      flash[:notice] = "You are not authorized to edit this product!"
      redirect_to "/products/#{@product.id}"
    else
      true
    end
  end

  def update
    if @product.update(product_params)
      redirect_to product_path(@product.id)
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to products_path
  end

  def search_by_name
    @products = Product.where name: params[:product]
  end

  private

  def product_params
    params.require(:product).permit(:name,
                                    :price,
                                    :user_id,
                                    :inventory,
                                    :description,
                                    :photo,
                                    :retired)
  end

  def set_product
    @product = Product.find(params[:id])
  end
end
