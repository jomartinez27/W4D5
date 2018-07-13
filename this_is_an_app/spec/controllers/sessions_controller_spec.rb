require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  describe 'GET #new' do
    it "renders the new sessions templatez" do
      get :new
      expect(response).to render_template(:new)
    end
  end
  
  describe 'POST #create' do 
    context 'with valid params' do
      it "logs in the user" do
        post :create, params: {user: {username: 'Snorlax', password: 'Pokeflute'}}
        snor = User.find_by_username('Snorlax')
        expect(session[:session_token]).to eq(snor.session_token)
      end
      
      it "redirects to user's show page" do
        post :create, params: {user: {username: 'Sandshrew', password: 'sandshreeeeeeeeeeew'}}
        sand = User.find_by(username: 'Sandshrew')
        expect(response).to redirect_to(user_url(sand))
      end
    end
  end
end
