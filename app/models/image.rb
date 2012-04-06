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
#  created_at  :datetime
#  updated_at  :datetime
#

class Image < ActiveRecord::Base
  
  belongs_to :group
  has_many :entities
  has_many :metadata

  validates_presence_of :file_name, :name
  
end
