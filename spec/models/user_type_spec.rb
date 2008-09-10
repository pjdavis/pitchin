require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe UserType do
  before(:each) do
    @valid_attributes = {
      :user_id => "1",
      :type_id => "1"
    }
  end

  it "should create a new instance given valid attributes" do
    UserType.create!(@valid_attributes)
  end
  
  it "should have a user id" do
    lambda do
      ut = UserType.create(:user_id => nil)
      ut.errors.on(:user_id).should_not be_nil
    end.should_not change(UserType, :count)
  end
  
  it "should have a type id" do
    lambda do
      ut = UserType.create(:type_id => nil)
      ut.errors.on(:type_id).should_not be_nil
    end.should_not change(UserType, :count)
  end
end
