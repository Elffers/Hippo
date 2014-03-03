require 'spec_helper'

describe ProductsController do
  let(:authenticated_user) {
    double("authenticated user", {
      :id => 42,
     })
  }

  describe 'POST #create', wip: true do
    before do
      subject.stub(current_user: authenticated_user)
    end
    let(:valid_attributes) { {
      name:        "Foo Product",
      description: "Bar Baz Bat",
      price:       123,
      inventory:   7,
    } }
    let(:invalid_attributes) { valid_attributes.except(:name) }

    context 'with valid attributes' do
      it 'should create a new product' do
        expect{
          post :create, product: valid_attributes
        }.to change(Product, :count).by(1)
      end

      it "should associate the new product with the current user" do
        post :create, product: valid_attributes

        expect(Product.last.user_id).to eq(authenticated_user.id)
      end

      it "redirects to the new product" do
        post :create, product: valid_attributes

        expect(response).to redirect_to("/products/#{Product.last.id}")
      end
    end

    context 'with invalid attributes' do
      it "should not create a new product" do
        expect{
          post :create, product: invalid_attributes
        }.not_to change(Product, :count)
      end

      it 'redirects with a flash message' do
        post :create, product: invalid_attributes

        expect(flash[:notice]).to include('There was an error')
        expect(response).to redirect_to("/products/new")
      end
    end
  end
end