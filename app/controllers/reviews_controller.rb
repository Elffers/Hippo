class ReviewsController < ApplicationController

  def new
    @review = Review.new
    #@product = Product.find(params[:id])
  end

  def show
    @review = Review.find(params[:id])
  end

  def create # Are we going to have a problem if current_user.id == nil here?
    @review = Review.new(review_params)
    @review.product_id = @product.id
    if session[:user_id] == @product.user_id
      flash[:notice] = "You can't review your own products. That's cheating. >:("
    else
      @review = Review.new(review_params)
      @review.save
      if @review.save && current_user
        redirect_to "/reviews/#{@review.id}", notice: "We hear ya! Review posted as #{user.find(session[:user_id])}."
      elsif @review.save
        redirect_to "/reviews/#{@review.id}", notice: "We hear ya! Posted as guest."
      end    
    end
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
    params.require(:review).permit(:rating, :description, :product_id)
  end

end