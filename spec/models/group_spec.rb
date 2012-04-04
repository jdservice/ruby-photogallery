require 'spec_helper'

describe Group do
  
  before(:all) do
    @list_of_groups = [
      ['Groupe 1', 'Group Description 1'],
      ['Group 2', 'Group Description 2'],
<<<<<<< HEAD
      ['Group 2', 'Group Description 3'],
=======
      ['Groupe 1', 'Group Description 3'],
>>>>>>> amalc/master
      ['Group 4', 'Group Description 4'],
      ['Group 5', 'Group Description 5']
      ]
  end
  
  it "creates groups given a list of groups" do
<<<<<<< HEAD
    @list_of_groups.each do |g|
      Group.create!(
        :name => g[0],
        :description => g[1])
    end
    Group.all.count.should eq(5)    
    Group.find_by_name('Group 1').name.should eq(@list_of_groups [0][0])
    Group.find_by_name('Group 2').name.should eq(@list_of_groups [1][0])
    
    # simple test examples
    Group.all.count.should eq(5)
    Group.find_by_name(@list_of_groups[0][0]).name.should eq(@list_of_groups[0][0])
    Group.find_by_name(@list_of_groups[0][0]).name.should_not eq(@list_of_groups[1][0])    
    
=======
    Group.create!(:name => @list_of_groups[0][0], :description => @list_of_groups[0][1])
    expect { Group.create!(:name => @list_of_groups[0][0], 
      :description => @list_of_groups[0][1]) }.to raise_error('Validation failed: Name must be unique') 
>>>>>>> amalc/master
  end
  
end
