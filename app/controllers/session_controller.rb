class SessionController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id 
      redirect_to @products, notice: "Hip Hipporay! You are now logged in as #{user.email}!"
    else
      render "new", notice: "Invalid email or password :("
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "You are now logged out! Hip Hop awaaaaaayyy!"
  end

end
