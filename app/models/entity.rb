# == Schema Information
#
# Table name: entities
#
#  id          :integer(4)      not null, primary key
#  image_id    :integer(4)
#  name        :string(255)
#  entity_type :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

class Entity < ActiveRecord::Base
  
  belongs_to :image
  
end
