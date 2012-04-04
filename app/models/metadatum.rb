# == Schema Information
#
# Table name: metadata
#
#  id         :integer(4)      not null, primary key
#  image_id   :integer(4)
#  name       :string(255)
#  value      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Metadatum < ActiveRecord::Base
  
  belongs_to :image
  
end
