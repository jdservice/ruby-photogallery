require 'spec_helper'

describe Group do
  pending "add some examples to (or delete) #{__FILE__}"
end

describe Group do
  
  it "should create a group with a name of group" do
    group = Group.create!(
      :name => 'test group'
    )
    group.name.should eq('test group')
  end
end
