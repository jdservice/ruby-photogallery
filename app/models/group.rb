class Group < ActiveRecord::Base
  
  has_many :images
  validates_uniqueness_of :name
  
end
