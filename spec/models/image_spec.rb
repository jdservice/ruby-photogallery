require 'spec_helper'

describe Image do
  it "should create an image given a file name" do
    image = Image.create!(
      :file_name => 'xyzzy.jpg'
    )
    image.file_name.should eq('xyzzy.jpg')
  end
end
