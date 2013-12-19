require 'spec_helper'

describe OrdersController do
  before do
    @order = Order.create(user_id: 1, status: "pending")
    @product = Product.create(name:"banana", price: 10, inventory:10, description:"yellow yum", user_id: 1)
  end


  describe "GET 'show'" do
    it "returns http success" do
      get 'show', id: 1
      response.should be_success
    end
  end

  describe "GET 'add_product'" do
    it "returns http success" do
      get 'add_product', id: 1, product_id: 1
      response.should be_success
    end
  end



end
