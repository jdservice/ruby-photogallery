# == Schema Information
#
# Table name: groups
#
#  id          :integer(4)      not null, primary key
#  name        :string(255)
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#

class Group < ActiveRecord::Base
  
  has_many :images
<<<<<<< HEAD
  validates_uniqueness_of :name
  
=======
  validates_uniqueness_of :name, :on => :create, :message => "muust be unique"

>>>>>>> amalc/master
end
