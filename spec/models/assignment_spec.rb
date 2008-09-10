require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Assignment do
  
  define_models
  
  before(:each) do
    @valid_attributes = {
      :task_id => "1",
      :user_id => "1"
    }
  end

  it "should create a new instance given valid attributes" do
    Assignment.create!(@valid_attributes)
  end
  
  it "should require user_id" do
    lambda do
      ass = Assignment.create(:user_id => nil)
      ass.errors.on(:user_id).should_not be_nil
    end.should_not change(Assignment, :count)
  end
  
  it "should require task_id" do
    lambda do
      ass = Assignment.create(:task_id => nil)
      ass.errors.on(:task_id).should_not be_nil
    end.should_not change(Assignment, :count)
  end
  
end
