# == Schema Information
#
# Table name: images
#
#  id          :integer(4)      not null, primary key
#  group_id    :integer(4)
#  file_name   :string(255)
#  file_type   :string(255)
#  name        :string(255)
#  description :text
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#

class Image < ActiveRecord::Base
  
  belongs_to :group
  has_many :entities
  has_many :metadata
  has_and_belongs_to_many :tags
  has_and_belongs_to_many :enumerated_types
    
  validates_presence_of :file_name, :name
  validates_uniqueness_of :name
  
end
