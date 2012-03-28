require 'spec_helper'

describe Group do
  pending "add some examples to (or delete) #{__FILE__}"
end

describe Group do
  
  before(:all) db
    @list_of_groups = [
      ['group1','group description'],  
      ['group2','group description'],  
      ['group3','group description'],  
      ['group4','group description'],  
      ['group5','group description']  
      ]
  end
  
  it "create groups given a list of groups" do
    @list_of_groups.each do |g|
      pp g
      # Group.create!(
      #  :name => g[0],
      #  :description => g[1]
      )
    end
  end
  
  it "should create a group with a name of group" do
    group = Group.create!(
      :name => 'test group'
    )
    group.name.should eq('test group')
  end

end
