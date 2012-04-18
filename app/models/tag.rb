class Tag < ActiveRecord::Base

  has_and_belongs_to_many :images

  validates_presence_of :name
   
end
