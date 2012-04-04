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

require 'spec_helper'

describe Image do
  it "should create an image given a file name" do
    image = Image.create!(
      :file_name => 'xyzz.jpg'
    )
    image.file_name.should eq('xyzz.jpg')
  end
end
