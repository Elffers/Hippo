require 'spec_helper'

describe ProductsController do
  describe "GET index" do
    it "populates an array of products" do
      product = Product.create(name: "shoes", price: 9.99, user_id: 1)
      get :index
      assigns(:products).should eq([product])
    end
  end
end