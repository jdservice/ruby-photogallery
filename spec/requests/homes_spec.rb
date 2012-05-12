require 'spec_helper'

describe "Homes", :type => :request do
  before :each do
    User.create(:username => 'testuser', :password => 'good2012', :password_confirmation => 'good2012', :email => 'test@email.com')
  end
  
  describe "POST /homes" do
    it "should register me and logout" do
      visit homes_url
      click_link 'Register'
      page.should have_content("Username")
      fill_in 'user[username]', :with => 'testuserReg'
      fill_in 'user[password]', :with => 'good2012Reg'
      fill_in 'user[password_confirmation]', :with => 'good2012Reg'
      fill_in 'user[email]', :with => 'testuserReg@gmail.com'
      click_button 'Submit'
      page.should have_content("Account registered!")
            
      click_link 'Log out'
      page.should have_content("Successfully logged out")
    end
    
    it "should log me in and check My Info" do
      visit homes_url
      click_link 'Login'
      page.should have_content("Username")
      fill_in 'user_session[username]', :with => 'testuser'
      fill_in 'user_session[password]', :with => 'good2012'
      click_button 'Login'
      page.should have_content("Successfully logged in")
      
      click_link 'My Info'
      page.should have_content("My Information")
    end
  
    it "should fail to log me in" do
      visit homes_url      
      click_link 'Login'
      page.should have_content("Username")
      fill_in 'user_session[username]', :with => 'testuserBad'
      fill_in 'user_session[password]', :with => 'good2012Bad'
      click_button 'Login'
      page.should have_content("Login failed")
    end
  end
end