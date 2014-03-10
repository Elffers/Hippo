require 'spec_helper'

class UserControllerTest < ActionController::TestCase
  describe 'GET #new' do 
    it 'assigns @user as an instance of User' do 
      let(:user) { create(:user) }
      get :new
      expect(@user).to be_an_instance_of(:user)
    end
  end

  describe 'POST #create' do 
    context 'with valid attributes' do 
      let(:user) { create(:user) }

      it 'increases user count by 1' do
        expect { post :create, user: user}.to change(User, :count).by(1)
      end

      it 'redirects to root path' do
        post :create, user: user
        expect(response).to redirect_to root_path
      end

      it 'creates new session' do 
        post :create, user: user
        assigns(session[:user_id]).to == user.id 
      end
    end

    context 'with invalid attributes' do
      let(:invalid_user) { create(:invalid_user) } 
      it 'renders new template' do 
        post :create, user: invalid_user
        expect(response).to render_template :new
      end

      it 'sets a flash notice' do 
        post :create, user: invalid_user
        expect(:notice).to include 'There was a problem saving this user! :('
      end
    end
  end
end
