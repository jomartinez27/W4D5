require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Validations" do 
    it {should validate_presence_of(:username)}
    it {should validate_presence_of(:session_token)}
    it {should validate_presence_of(:password_digest)}
    it {should validate_length_of(:password).is_at_least(6)}
  end 
  
  describe "session_token" do 
    it "assigns a session token if one is not given" do
      expect(FactoryBot.build(:user).session_token).not_to be_nil
    end
  end
  
  describe "password_digest" do
    it 'doe save passwords to the database' do 
      User.create(username: "Bulbasaur", password: 'Bulba56')
      user = User.find_by(username: 'Bulbasaur')
      expect(user.password).not_to eq('Bulba56')
    end 
  end 
  
  
  describe "::find_by_credentials" do
    it "return user found by credentials" do
      bulba = User.create(username: "Bulbasaur", password: 'Bulba56')
      expect(User.find_by_credentials('Bulbasaur', 'Bulba56')).to eq(bulba)
    end
  end
  
  # describe "associations" do 
  #   it { should have_many }
  # end
end

