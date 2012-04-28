# == Schema Information
#
# Table name: enumerated_types
#
#  id         :integer(4)      not null, primary key
#  group_name :string(255)
#  name       :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class EnumeratedType < ActiveRecord::Base

  has_and_belongs_to_many :images

  validates_presence_of :name, :group_name
  
end
