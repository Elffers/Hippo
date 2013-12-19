class ReviewsController < ApplicationController

  def new
    @review = Review.new
  end

 
  def create # Are we going to have a problem if current_user.id == nil here?
    @review = Review.new(review_params)
    @review.product_id = params[:product_id]
    @product = Product.find_by(params[:product_id])
    # if session[:user_id] == @product.user_id
    #   flash[:notice] = "You can't review your own products. That's cheating. >:("
    #   redirect_to "/products/#{@product.id}"
    # else
    #   @review = Review.new(review_params)
    #   @review.save
    #   if @review.save && current_user
    #     redirect_to "/reviews/#{@review.id}", notice: "We hear ya! Review posted as #{user.find(session[:user_id])}."
    #   elsif @review.save
    #     redirect_to "/reviews/#{@review.id}", notice: "We hear ya! Posted as guest."
    #   end    
    
    if @review.save
      flash[:notice] = "You have successfully posted this review"
      redirect_to "/products/#{@product.id}" 
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit   
    @review = Review.find(params[:id]) 
  end

  def update
    @review.product_id = params[:id]
    @review = Review.find(params[:id])
    if @review.update(review_params)
      redirect_to reviews_path
    else
      render :edit
    end
  end

  def destroy
    @review = Review.find(params[:id])  
    @review.destroy
    redirect_to reviews_path  
  end
  
  private

  def review_params
    params.require(:review).permit(:rating, :description, :product_id) # because of embedded resources, the product_id is already being passed in via params
  end

end