require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Type do
  before(:each) do
    @valid_attributes = {
      :name => "value for name"
    }
  end

  it "should create a new instance given valid attributes" do
    Type.create!(@valid_attributes)
  end
  
  it "should require a name" do
    lambda do
      type = Type.create(:name => nil)
      type.errors.on(:name).should_not be_nil
    end.should_not change(Type, :count)
  end
  
end
