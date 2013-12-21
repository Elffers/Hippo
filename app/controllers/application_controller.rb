class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :top_categories

  def require_login
    unless session[:user_id].present?
      redirect_to sign_in_path
    else
      true
    end
  end

 private
   def top_categories
    @products = Product.all
    @categories = Category.all.map do |c| 
      [c, c.products.count]
    end
    @top_categories = @categories.sort_by{|x| x[1]}.reverse
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
     #else the session[:user_id] is nil for a guest browser
   rescue ActiveRecord::RecordNotFound #rescue is cued by error from nil 
    @current_user = User.create
    session[:user_id] = @current_user.id
    @current_user
  end

  def current_order
    # if Order.find(session[:order_id]).status != "pending"
      @current_order ||= Order.find(session[:order_id]) 
    # else
    #   @current_order = Order.create
    # end
  rescue ActiveRecord::RecordNotFound 
    @current_order = Order.create
    session[:order_id] = @current_order.id
    @current_order
  end

  helper_method :current_order
  helper_method :current_user
  helper_method :require_login
  helper_method :top_categories

end
