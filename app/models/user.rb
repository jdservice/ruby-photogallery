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

class User < ActiveRecord::Base
  acts_as_authentic
  
  def name
    username
  end

  def destroy
    self.record_status = 'Deleted'
    self.save
  end
  
end
