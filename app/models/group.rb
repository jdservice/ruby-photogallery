# == Schema Information
#
# Table name: groups
#
#  id          :integer(4)      not null, primary key
#  name        :string(255)
#  description :text
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#

class Group < ActiveRecord::Base
  
  has_many :images
  validates_uniqueness_of :name
  validates_presence_of :name
    
end
