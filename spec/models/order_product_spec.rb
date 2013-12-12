require 'spec_helper'

describe OrderProduct do
    before do 
      @product = Product.create(name: "shoes", price: 1.00, user_id: 1, description: "put it on yo feet", inventory: 3, retired: true)
      @user = User.create(email: "blake.jennings@gmail.com", password: "dog", password_confirmation: "dog")
      @order = Order.create(product_id: @product.id, user_id: @user.id, quantity: 1)
      @orderproduct = OrderProduct.create(product_id: @product.id, order_id: @order.id)
    end

  it "belongs to order" do
    expect(@orderproduct.order).to eq @order
  end

  it "belongs product" do
    expect(@orderproduct.product).to eq @product
  end

  it "quantity must be present" do
    expect(OrderProduct.create(product_id: @product.id, order_id: @order.id, quantity: nil)).to_not be_valid
  end
  
  it "quantity must be an integer" do 
    orderproduct = Order.new(quantity: 1.2)
    expect(orderproduct).to_not be_valid
  end

  it "has a quantity greater than 0" do
    orderproduct = Order.new(quantity: 0)
    expect(orderproduct).to_not be_valid
  end
end
