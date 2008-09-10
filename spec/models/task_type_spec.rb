require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe TaskType do
  before(:each) do
    @valid_attributes = {
      :task_id => "1",
      :type_id => "1"
    }
  end

  it "should create a new instance given valid attributes" do
    TaskType.create!(@valid_attributes)
  end
  
  it "should have a task id" do
    lambda do
      ut = TaskType.create(:task_id => nil)
      ut.errors.on(:task_id).should_not be_nil
    end.should_not change(TaskType, :count)
  end
  
  it "should have a type id" do
    lambda do
      ut = TaskType.create(:type_id => nil)
      ut.errors.on(:type_id).should_not be_nil
    end.should_not change(TaskType, :count)
  end
end
