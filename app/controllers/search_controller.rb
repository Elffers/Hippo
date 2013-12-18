# How Search should work:
# Take query from the text field in the navbar
# Run a search for query in Products and return product objects in array @products based on name & description
# Run a search for query in Categories and return category objects in array @categories based on name
# Run a search for query in Users and return User objects in array @users based on user name
# Files affected:
# app/models/search.rb
# app/views/layouts/application.html.erb
# app/controllers/application_controller.rb? or app/controllers/welcome_controller.rb?
# config/routes.rb

class SearchController < ApplicationController
  def show
    concat_search
    if @results == {:users=>[], :categories=>[], :products=>[]}
      flash[:notice] = "No items match your search"
      redirect_to root_path
    else 
      flash[:notice] = "these are all the results for #{params[:search]}"
      render :index
    end
  end

  private
  def search_user
    @users = User.where('name LIKE ?', "%#{params[:search]}%")
  end

  def search_category
    @categories = Category.where('name LIKE ?', "%#{params[:search]}%")
  end

  def search_product
    @products = Product.where('name LIKE ? OR description LIKE ?', "%#{params[:search]}%", "%#{params[:search]}%" )
  end

  def concat_search
    search_user
    search_category
    search_product
    @results = {:users => @users, :categories => @categories, :products => @products} 
  end
end