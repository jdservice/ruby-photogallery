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

  tags = %w(tag-1 tag-2 tag-3 tag-4 tag-5 tag-6)
  tags_2 = %w(tag-7 tag-8 tag-9 tag-10)

  before(:each) do
    Image.delete_all
    Tag.delete_all

    @image = Image.create!(
      :file_name => 'xyzz.jpg'
    )

    tags.each do |t|
      Tag.create!(
          :name  => t
      )
    end
  end

  it "should create tags " do
    Tag.all.count.should eq(tags.count)
  end

  it "should add tags to a given image" do
    Tag.all.each { |t| @image.tags << t }
    image = Image.create!(:file_name => 'xyzzy.jpg')
    tags_2.each { |t| image.tags << Tag.create!(:name => t) }

    image.tags << Tag.find_by_name('tag-1')
    Tag.find_by_name('tag-1').images.each { |i| pp i.file_name }
  end

end
