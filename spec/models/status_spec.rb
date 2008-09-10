require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Status do
  before(:each) do
    @valid_attributes = {
      :completed => false,
      :name => "value for name"
    }
  end

  it "should create a new instance given valid attributes" do
    Status.create!(@valid_attributes)
  end
  
  it "should have a name" do
    lambda do
      stat = Status.create(:name => nil)
      stat.errors.on(:name).should_not be_nil
    end.should_not change(Status, :count)
  end
end
