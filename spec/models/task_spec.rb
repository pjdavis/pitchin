require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Task do
  before(:each) do
    @valid_attributes = {
      :project_id => "1",
      :name => "value for name",
      :requestor_id => "1",
      :requested_at => Time.now,
      :due_at => Time.now,
      :expires_at => Time.now,
      :status_id => "1"
    }
  end
  
  define_models

  it "should create a new instance given valid attributes" do
    Task.create!(@valid_attributes)
  end
  
  it "should require a name" do
    lambda do
     task = Task.create(:name => nil)
     task.errors.on(:name).should_not be_nil
    end.should_not change(Task, :count)
  end
  
  it "should require a requestor" do
    lambda do
      task = Task.create(:requestor_id => nil)
      task.errors.on(:requestor_id).should_not be_nil
    end.should_not change(Task, :count)
  end
  
  it "should require a reqested at time" do
    lambda do
      task = tasks(:default)
      task.update_attribute(:requested_at, nil)
      task.errors.should_not be_nil
    end.should_not change(Task, :count)
  end
  
  it "should require a due date" do
    lambda do
      task = Task.create(:due_at => nil)
      task.errors.on(:due_at).should_not be_nil
    end.should_not change(Task, :count)
  end
  
  it "should validate that due date is after requested at" do 
    lambda do
      task = tasks(:default)
      task.due_at = Time.now
      task.requested_at = Time.now.next_week
      task.save
      task.errors.should_not be_nil
    end.should_not change(Task, :count)
  end
  
  it "should be completed if the status is a completed status" do
    tasks(:completed_task).completed?.should be_true
  end
  
end
