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
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#

require 'spec_helper'

describe Image do

  tags = %w(tag-1 tag-2 tag-3 tag-4 tag-5 tag-6)
  tags_2 = %w(tag-7 tag-8 tag-9 tag-10)
  
  etypes = %w(People Places Groups Year Collection)

  before(:each) do
    Image.delete_all
    Tag.delete_all
    EnumeratedType.delete_all

    # Alternate syntax for a create
    #@image = Image.new
    #@image.file_name = 'plugh.jpg'
    #@image.name = 'plugh'
    #@image.save!

    @image = Image.create!(
      :name => 'plugh',
      :file_name => 'plugh.jpg'
    )

    tags.each do |t|
      Tag.create!(
          :name  => t
      )
    end

    etypes.each do |g|
      EnumeratedType.create!(
        :name => 'plugh',
        :group_name => g
      )
    end
    
  end

  it "should create tags " do
    Tag.all.count.should eq(tags.count)
  end

  it "should create enumerated_types " do
    EnumeratedType.all.count.should eq(etypes.count)
  end
  
  it "should add tags to a given image" do
    # Tag @image with all available tags, note an instance variable starting with an @
    # is different from a local variable
    Tag.all.each { |t| @image.tags << t }
    @image.tags.count.should eq(tags.count)

    # Create a new image
    image = Image.create!(:file_name => 'xyzzy.jpg', :name => 'xyzzy')

    # Create new tags and add them to the image
    tags_2.each { |t| image.tags << Tag.create!(:name => t) }

    # Find one tag and add it to the image
    image.tags << Tag.find_all_by_name('tag-1')

    # Find a tag and see which images are tagged with it.
    Tag.find_by_name('tag-1').images.each { |i| pp i.file_name }
    Tag.find_by_name('tag-1').images.count.should eq(2)
  end

  it "should add enumerated_types to a given image" do
    EnumeratedType.all.each { |g| @image.enumerated_types << g }
    @image.enumerated_types.count.should eq(etypes.count)
  end
    
  it "should add multiple tags to an image in a single operation using wildcards" do
    many_tags = Tag.where{(name =~ 'tag%')}
    many_tags.count.should eq(tags.count)
    @image.tags << many_tags
    @image.tags.count.should eq(tags.count)
  end

  it "should add multiple tags to an image in a single operation another method" do
    @image.tags << Tag.all
    @image.tags.count.should eq(tags.count)
  end

  it "should add metadata given an image" do
    for i in 1..10 do
      #@image.metadata << Metadatum.create!(
      @image.metadata << Metadatum.create!(name: "meta-#{i}", value: "value-#{i}")
          #:value => "value-#{i}"
      #)
    end
    @image.metadata.count.should eq(10)
    image = Metadatum.find_all_by_name('meta-1').first.image
    image.should eq(@image)
  end

end
