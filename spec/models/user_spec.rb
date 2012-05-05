# == Schema Information
#
# Table name: users
#
#  id                :integer(4)      not null, primary key
#  created_at        :datetime        not null
#  updated_at        :datetime        not null
#  username          :string(255)     not null
#  email             :string(255)     not null
#  crypted_password  :string(255)     not null
#  password_salt     :string(255)     not null
#  persistence_token :string(255)     not null
#  login_count       :integer(4)      default(0), not null
#  last_request_at   :datetime
#  last_login_at     :datetime
#  current_login_at  :datetime
#  last_login_ip     :string(255)
#  current_login_ip  :string(255)
#

require 'spec_helper'

describe User do
  
  it "should create a user with an encrypted password" do
    u = User.new
    u.username = 'testuser',
    u.password = 'hello',
    u.password_confirmation = 'hello',
    u.email = 'test@example.com'
    u.save
    
    u.crypted_password.should_not eq('hello')    
  end
  
  
end
