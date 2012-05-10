require 'spec_helper'

describe "Homes", :type => :request do
  before :each do
    User.create(:username => 'testuser', :password => 'good2012')
  end
  
  describe "POST /homes" do
    it "should register me, logout and login me again" do
      visit homes_url
      click_link 'Register'
      page.should have_content("Username")
      fill_in 'user[username]', :with => 'testuser'
      fill_in 'user[password]', :with => 'good2012'
      fill_in 'user[password_confirmation]', :with => 'good2012'
      fill_in 'user[email]', :with => 'testuser@gmail.com'
      click_button 'Submit'
      page.should have_content("Account registered!")
            
      click_link 'Log out'
      # page.driver.browser.switch_to.alert.accept
      # click_button 'OK'
      page.should have_content("Successfully logged out")     
        
      click_link 'Login'
      page.should have_content("Username")
      fill_in 'user_session[username]', :with => 'testuser'
      fill_in 'user_session[password]', :with => 'good2012'
      click_button 'Login'
      page.should have_content("Successfully logged in")
    end
  
    it "should fail to log me in" do
      visit homes_url      
      click_link 'Login'
      page.should have_content("Username")
      fill_in 'user_session[username]', :with => 'testuser'
      fill_in 'user_session[password]', :with => 'good2012'
      click_button 'Login'
      page.should have_content("Login failed")
    end
  end
end