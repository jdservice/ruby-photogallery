require 'spec_helper'

describe Group do
  
  before(:all) do
    @list_of_groups = [
      ['Group 1', 'Group Description 1'],
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
    Group.all.count.should eq(5)
    puts Group.find_by_name('Group 1').name
    
  end
  
end
