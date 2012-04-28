require 'spec_helper'

describe "Homes", :type => :request do
  before :each do
    User.create(:login => 'testuser', :password => 'good2012')
  end
  
  describe "POST /homes" do
    it "logs me in" do
      visit homes_url
      click_link 'Login'
      page.should have_content("Username")
      fill_in 'user_session[username]', :with => 'testuser'
      fill_in 'user_session[password]', :with => 'good2012'
      click_button 'Login'
      page.should have_content("Successfully logged in")
    end
  end
end