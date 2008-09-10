require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Permission do
  before(:each) do
    @valid_attributes = {
      :user_id => "1",
      :role_id => "1"
    }
  end

  it "should create a new instance given valid attributes" do
    Permission.create!(@valid_attributes)
  end
  
  it "should require a user" do
    lambda do
      per = Permission.create(:user_id => nil)
      per.errors.on(:user_id).should_not be_nil
    end.should_not change(Permission, :count)
  end
  
  it "should require a role" do
    lambda do
      per = Permission.create(:role_id => nil)
      per.errors.on(:role_id).should_not be_nil
    end.should_not change(Permission, :count)
  end
  
end
