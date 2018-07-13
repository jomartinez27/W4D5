require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'Get #new' do 
    it 'renders the new users template' do 
      get :new 
      expect(response).to render_template(:new)
    end  
  end 
  
  describe 'Post #create' do 
    context 'with valid params' do 
      it 'signs up the user' do 
        post :create, params: {user: {username: 'charmander', password: 'charchar'}}
        char = User.find_by(username: 'charmander')
        expect(session[:session_token]).to eq(char.session_token)
      end 
      it 'redirects to user\'s show page' do 
        post :create, params: {user: {username: 'charmander', password: 'charchar'}}
        char = User.find_by(username: 'charmander')
        expect(response).to redirect_to(user_url(char))
      end 
    end 
    context 'without valid params' do 
      it 'does not create user and gives errors' do 
        post :create, params: {user: {username: 'charmander'}}
        expect(response).to render_template(:new)
        expect(flash[:errors]).to be_present 
      end 
    end 
  end
end 
