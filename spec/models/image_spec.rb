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

  tags = %w(tag-1 tag-2 tag-3 tag-4 tag-5)

  it "should create an image given a file name" do
    image = Image.create!(
      :file_name => 'xyzz.jpg'
    )
    image.file_name.should eq('xyzz.jpg')
  end

  it "should create a tag given an image" do
    pp tags
  end

end
