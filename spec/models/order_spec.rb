require 'spec_helper'

describe Order do
  before do 
    @product = Product.create(name: "shoes", price: 1.00, user_id: 1, description: "put it on yo feet", inventory: 3, retired: true)
    @user = User.create(email: "blake.jennings@gmail.com", password: "dog", password_confirmation: "dog")
    @order = Order.create(user_id: @user.id, status: "pending")
  end

  
end
