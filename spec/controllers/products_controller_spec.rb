require 'spec_helper'

describe ProductsController do

  describe 'GET #show' do
    it 'shows all users'
  end

  describe 'GET #new' do
    it 'should render the new template'
    it 'is a redirect'
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'should create a new product'
      it 'should save the product'
    end

    context 'with invalid attributes' do
      it 'sends a flash message'
    end
  end

  describe 'POST #edit' do
    it 'locates the requested product'
  end

  describe 'PATCH #update' do
    context 'with valid attributes' do
      it 'locates the requested product'
      it 'updates the products attributes'
      it 'redirects to product show page'
    end

    context 'with invalid attributes' do
      it 'does not update the products attributes'
    end
  end

  describe 'DELETE #destroy' do
    it 'deletes the products and changes the count by -1'
  end

  describe 'GET #search_by_name' do
    it 'retrieves product that was searched'
  end

end 