require 'spec_helper'

describe ProductsController do
  before do
    Product.delete_all
  end

  describe "GET index" do
    it "populates an array of products" do
      product = Product.create(name: "shoes", price: 9.99, user_id: 1)
      get :index
      assigns(:products).should eq([product])
    end

    it "renders the :index view" do
      get :index
      response.should render_template :index
    end
  end

  describe "GET show" do
    it "assigns the requested product to @product" do
      product = Product.create(name: "shoes", price: 9.99, user_id: 1)
      get :show, id: product
      assigns(:product).should eq(product)
    end

    it "renders the :show template" do
      product = Product.create(name: "shoes", price: 9.99, user_id: 1)
      get :show, id: product
      response.should render_template :show
    end
  end

  describe "GET new" do
    it "renders the :new template" do
      get :new
      response.should render_template :new
    end
    pending "is only available to signed in users"
  end

  describe "GET edit" do
    it "renders the edit template" do
      product = Product.create(name: "shoes", price: 9.99, user_id: 1)
      get :edit, id: product
      response.should render_template :edit
    end
  end

  describe "POST create" do
    it "saves the new product to database" do
      expect{
        post :create, product: {name: "shoes", price: 9.99, user_id: 1}
      }.to change(Product,:count).by(1)
    end

    it "redirects to the list of products" do
      post :create, product: {name: "shoes", price: 9.99, user_id: 1}
      response.should redirect_to products_path
    end
  end
end







