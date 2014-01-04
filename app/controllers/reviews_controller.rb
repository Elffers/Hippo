class ReviewsController < ApplicationController

  def new
    @review = Review.new
    @product = Product.find(params[:product_id])
  end
 
  def create # Are we going to have a problem if current_user.id == nil here?
    @product = Product.find(params[:product_id])
    if session[:user_id] == @product.user_id
      flash[:notice] = "You can't review your own products. That's cheating. >:("
      redirect_to product_path(params[:product_id])
    elsif @product.reviews.where(user_id:session[:user_id]).exists?
      flash[:notice] = "You have already posted a review for this product!"
      redirect_to product_path(params[:product_id])
    else
      @review = Review.new(review_params)
      @review.product_id = params[:product_id]
      @review.user_id = session[:user_id]
      if @review.save
        flash[:notice] = "You have successfully posted this review!"
        redirect_to product_path(params[:product_id])
      else
        flash[:notice] = "You must add a description!"
        render :new
      end
    end
  end

  def index
    @product = Product.find(params[:product_id])
  end

  def edit   
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    @product = @review.product
    if @review.update(review_params)
      redirect_to product_path(@product)
    else
      render :edit
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to product_path(@review.product)
  end
  
  private

  def review_params
    params.require(:review).permit(:rating, :description, :product_id) # because of embedded resources, the product_id is already being passed in via params
  end

end