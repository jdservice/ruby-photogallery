require 'spec_helper'

describe Image do

  tags = %w(tag-1 tag-2 tag-3 tag-4 tag-5)
  tags2 = %w(tag-11 tag-12 tag-13 tag-14)

  before(:all) do
    Image.delete_all
    Tag.delete_all
    
    @list_of_images = [
      ['Image 1', 'Beach', 'abc1.jpg', 'jpg'],
      ['Image 2', 'Bar', 'abc2.jpg', 'jpg'],
      ['Image 3', 'Pool', 'abc3.jpg', 'jpg'],
      ['Image 4', 'Bar 2', 'def1.gif', 'gif'],
      ['Image 5', 'Restaurant', 'def2.gif', 'gif']
      ]

    tags.each do |t|
      Tag.create!(
        :name => t
      )
    end
            
    @list_of_images.each do |g|
      Image.create!(
        :name => g[0],
        :description => g[1],
        :file_name => g[2],
        :file_type => g[3])
    end  
    
    @image = Image.create!(
      :file_name => 'xyzzy.jpg',
      :name => 'PLUGH'
    )
    
  end

  it "should create a tag given an image" do
    Tag.all.count.should eq(tags.count) 
  end

  it "creates images assigned to some groups" do
    Image.all.count.should eq(6)
    Image.find_by_name('Image 1').name.should eq(@list_of_images [0][0])
    Image.find_by_name('Image 2').name.should eq(@list_of_images [1][0])
    Image.find_all_by_description('Beach').count.should eq(1)
    Image.find_all_by_file_type('jpg').count.should eq(3)
  end

  it "should add tags to a given image" do

#    tag = Tag.find_by_name('tag-1')
#    @image.tags << tag

    Tag.all.each { |t| @image.tags << t }
    pp @image
    pp @image.tags
    
    tags2.each { |t| image.tags << Tag.create!(:name => t) }

  end

end
