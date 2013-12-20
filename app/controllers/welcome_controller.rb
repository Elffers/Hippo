class WelcomeController < ApplicationController
  def index
    @products = Product.all
    @categories = Category.all.map do |c| 
      [c, c.products.count]
    end
    @top_categories = @categories.sort_by{|x| x[1]}.reverse
  end
end
