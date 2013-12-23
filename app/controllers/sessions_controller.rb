class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(name: params[:name])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id 
      # this should attach order to user if signed in. 
      current_order.update(user_id:current_user.id) if current_user 
      redirect_to root_path, notice: "Hip Hipporay! You are now logged in as #{user.name}!"
      # To set previous orderproducts into current order if not checked out- should maybe be a private method?
      if user.orders != []
        user.orders.each do |order|
          if order.status == "pending" && order != current_order
            order.order_products.each do |op|
              op.update(order_id:current_order.id)
              order.destroy
            end
          end
        end
      end
      # also should have private method here to destroy any OPs put into the current order (i.e. as a guest) 
      # if the user owns the product
    else
      render :new, notice: "Invalid email or password :("
    end
  end

  def destroy
    User.find(session[:user_id]).orders.each do |order|
      if order.status == "pending" && order.order_products == []
        order.destroy
      end
    end
    session[:user_id] = nil
    session[:order_id] = nil

    redirect_to root_path, notice: "You are now logged out! Hip Hop awaaaaaayyy!"
  end

end
