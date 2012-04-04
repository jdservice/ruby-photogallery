# == Schema Information
#
# Table name: metadata
#
#  id         :integer(4)      not null, primary key
#  image_id   :integer(4)
#  name       :string(255)
#  value      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe Metadatum do
   
  before(:all) do
    @list_of_metadata = [
      ['m001', 'Image 1', 'Camera','Cannon', 'cstamp1',''],
      ['m002', 'Image 2', 'Camera','Nikon', 'cstamp2','mstamp2'],
      ['m003', 'Image 3', 'Camera','Nikon', 'cstamp3',''],
      ['m004', 'Image 4', 'Camera','Cannon','cstamp4','mstamp4'],
      ['m005', 'Image 4', 'GPS','loc5', 'cstamp5','mstamp5']
      ]
  end

  it "creates metadata assigned to some images" do
    @list_of_metadata.each do |g|
      Metadatum.create!(
        :id => g[0],
#        :image_id => g[1],
        :name => g[2],
        :value => g[3],
        :created_at => g[4],
        :updated_at => g[5]
        )
    end
    
    Metadatum.all.count.should eq(5)    
#    Metadatum.find_by_name('001').name.should eq(@list_of_metadata [0][2])
#    Metadatum.find_by_value('002').name.should eq(@list_of_metadata [1][3])
#    Metadatum.find_all_by_value('Nikon').count.should eq(2)
#    Metadatum.find_all_by_updated_at('mstamp5').count.should eq(1)
  end

end

