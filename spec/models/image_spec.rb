require 'spec_helper'

describe Image do
  
  it "should create an image given a file name" do
    image = Image.create!(
      :file_name => 'xyzzy.jpg'
    )
    image.file_name.should eq('xyzzy.jpg')
  end

  it "should create an image in gallery group" do
    image = Image.create!(
      :group => Group.create!(
        :name => 'Graduation',
        :description => 'ROR Master Class Graduation'
      ),
      :file_name => 'plugh.jpg'
    )
    image.group.name.should eq('Graduation')
  end
  
end

    
     


