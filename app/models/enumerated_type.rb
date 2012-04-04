# == Schema Information
#
# Table name: enumerated_types
#
#  id         :integer(4)      not null, primary key
#  group_name :string(255)
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class EnumeratedType < ActiveRecord::Base
end
