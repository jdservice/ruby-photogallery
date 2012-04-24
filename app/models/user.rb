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