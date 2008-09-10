require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe RoleRight do
  before(:each) do
    @valid_attributes = {
      :role_id => "1",
      :right_id => "1"
    }
  end

  it "should create a new instance given valid attributes" do
    RoleRight.create!(@valid_attributes)
  end
  
  it "should have a role" do
    lambda do
      rr = RoleRight.create(:role_id => nil)
      rr.errors.on(:role_id).should_not be_nil
    end.should_not change(RoleRight, :count)
  end
  
  it "should have a right" do
    lambda do
      rr = RoleRight.create(:right_id => nil)
      rr.errors.on(:right_id).should_not be_nil
    end.should_not change(RoleRight, :count)
  end
  
end
