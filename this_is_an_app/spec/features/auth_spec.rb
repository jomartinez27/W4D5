require 'rails_helper'

feature "Signing up" do 
  background :each do 
    visit new_user_path 
  end
  
  it 'has a user sign up page' do 
    expect(page).to have_content('Sign up')
  end
  
  it 'takes it a username and password' do 
    expect(page).to have_content('Username')
    expect(page).to have_content('Password')
  end
  
  it 'successfully signs up a user' do 
    fill_in 'Username', with: 'squirtle'
    fill_in 'Password', with: 'squirtlesquad'
    
    save_and_open_page
    click_button 'Create User'
  end
end  

feature 'login' do
  background :each do
    visit new_session_path
  end
  
  it "has a user login page" do
    expect(page).to have_content('Log in')
  end
  
  it "takes a username and password" do
    expect(page).to have_content('Password')
    expect(page).to have_content('Username')
  end
end 