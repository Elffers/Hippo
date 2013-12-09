class ProductsController < ApplicationController

  def index
    @products = Products.all
  end
end
