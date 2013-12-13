class ReviewsController < ApplicationController

  def new
    @reviews = Review.all
  end

  def show
    @review = Review.find(params[:id])
  end

  def create
    if current_user
      @review = Review.new(review_params)
      @review.save
      redirect_to "/reviews/#{@review.id}", notice: "We hear ya!"
    else
      redirect_to sign_in_path, notice: "You must sign in to post a review!"
    end
  end

  def edit   
    @review = Review.find(params[:id]) 
  end

  def update
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

end