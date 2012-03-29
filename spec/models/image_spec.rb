require 'spec_helper'

describe Image do

  before(:all) do
    @list_of_images = [
      ['Image 1', 'Beach', 'abc1.jpg', 'jpg'],
      ['Image 2', 'Bar', 'abc2.jpg', 'jpg'],
      ['Image 3', 'Pool', 'abc3.jpg', 'jpg'],
      ['Image 3', 'Bar 2', 'def1.gif', 'gif'],
      ['Image 5', 'Restaurant', 'def2.gif', 'gif']
      ]
  end

  it "creates images assigned to some groups" do
    @list_of_images.each do |g|
      Image.create!(
        :name => g[0],
        :description => g[1],
        :file_name => g[2],
        :file_type => g[3])
    end

    Image.all.count.should eq(5)
    Image.find_by_name('Image 1').name.should eq(@list_of_images [0][0])
    Image.find_by_name('Image 2').name.should eq(@list_of_images [1][0])
    Image.find_all_by_description('Beach').count.should eq(1)
    Image.find_all_by_file_type('jpg').count.should eq(3)

  end

end
