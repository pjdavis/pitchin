require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ProjectContact do
  before(:each) do
    @valid_attributes = {
      :contact_id => "1",
      :project_id => "1"
    }
  end

  it "should create a new instance given valid attributes" do
    ProjectContact.create!(@valid_attributes)
  end
end
