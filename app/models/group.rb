class Group < ActiveRecord::Base
  
  has_many :images
<<<<<<< HEAD
  validates_uniqueness_of :name
  
=======
  validates_uniqueness_of :name, :on => :create, :message => "muust be unique"

>>>>>>> amalc/master
end
