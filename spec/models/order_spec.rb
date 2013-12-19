require 'spec_helper'

describe Order do
  before do 
    @product = Product.create(name: "shoes", price: 1.00, user_id: 1, description: "put it on yo feet", inventory: 3, retired: true)
    @user = User.create(email: "blake.jennings@gmail.com", password: "dog", password_confirmation: "dog")
    @order = Order.create(product_id: @product.id, user_id: @user.id)
  end

  it "has a quantity greater than 0" do
    order = Order.new(quantity: 0)
    expect(order).to_not be_valid
  end
end
