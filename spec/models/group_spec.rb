#re published 21Apr2012

require 'spec_helper'

describe Group do
  
  before(:all) do
    @list_of_groups = [
      ['Groupe 1', 'Group Description 1'],
      ['Group 2', 'Group Description 2'],
      ['Group 3', 'Group Description 3'],
      ['Group 4', 'Group Description 4'],
      ['Group 5', 'Group Description 5']
      ]
  end
  
  it "creates groups given a list of groups" do
    @list_of_groups.each do |g|
      Group.create!(
        :name => g[0],
        :description => g[1])
    end
    # simple test examples
    Group.all.count.should eq(5)
    Group.find_by_name(@list_of_groups[0][0]).name.should eq(@list_of_groups[0][0])
    Group.find_by_name(@list_of_groups[0][0]).name.should_not eq(@list_of_groups[1][0])    
  end

  it "requires that group name be unique" do
    Group.create!(:name => 'unique', :description => '')
    group = Group.new(:name => 'unique', :description => 'non blank')
    group.should_not be_valid
    group.errors[:name].should include("has already been taken")
  end

end
