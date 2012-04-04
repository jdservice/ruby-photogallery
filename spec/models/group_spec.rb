# == Schema Information
#
# Table name: groups
#
#  id          :integer(4)      not null, primary key
#  name        :string(255)
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#

require 'spec_helper'

describe Group do
  
  before(:all) do
    @list_of_groups = [
      ['Groupe 1', 'Group Description 1'],
      ['Group 2', 'Group Description 2'],
      ['Groupe 1', 'Group Description 3'],
      ['Group 4', 'Group Description 4'],
      ['Group 5', 'Group Description 5']
      ]
  end
  
  it "creates groups given a list of groups" do
    Group.create!(:name => @list_of_groups[0][0], :description => @list_of_groups[0][1])
    expect { Group.create!(:name => @list_of_groups[0][0], 
      :description => @list_of_groups[0][1]) }.to raise_error('Validation failed: Name must be unique') 
  end
  
end
