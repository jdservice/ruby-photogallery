class Group < ActiveRecord::Base
  
  has_many :images
  validates_uniqueness_of :name, :on => :create, :message => "muust be unique"

end
