require 'spec_helper'

describe "Homes", type => :request do
  before :each do
    User.make(:user => 'testuser', :password => 'good2012')
  end
  
  describe "POST /homes" do
    it "logs me in" do
      visit homes_index_path
      fill_in 'Username', :with => 'testuser'
      fill_in 'Password', :with => 'password'
      click_button 'Log In'
      page.should have_content("Successfully logged in")
    end
  end
end
