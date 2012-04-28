# == Schema Information
#
# Table name: metadata
#
#  id         :integer(4)      not null, primary key
#  image_id   :integer(4)
#  name       :string(255)
#  value      :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

require 'spec_helper'

describe Metadatum do
  pending "add some examples to (or delete) #{__FILE__}"
end
