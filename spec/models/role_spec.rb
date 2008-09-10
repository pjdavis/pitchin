require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Role do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :description => "value for description"
    }
  end

  define_models

  it "should create a new instance given valid attributes" do
    Role.create!(@valid_attributes)
  end
  
  it "should have a name" do
    lambda do
      role = Role.create(:name => nil)
      role.errors.on(:name).should_not be_nil
    end.should_not change(Role, :count)
  end
  
  it "should be able to have a user" do
    users(:default).roles.should be_empty
    users(:default).roles << roles(:default)
    users(:default).roles.should_not be_empty
    users(:default).roles.first.should == roles(:default)
  end
  
  it "should be able to have rights" do
    role = roles(:no_rights)
    role.rights.should be_empty
    role.rights << rights(:default)
    role.rights.should_not be_empty
    role.rights.first.should == rights(:default)
  end
  
end
