require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Project do
  
  define_models
  
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :description => "value for description",
      :details => "value for details",
      :location => "value for location",
      :event_date => Time.now
    }
  end

  it "should create a new instance given valid attributes" do
    Project.create!(@valid_attributes)
  end
  
  it "should require a name" do
    lambda do
      proj = Project.create(:name => nil)
      proj.errors.on(:name).should_not be_nil
    end.should_not change(Project, :count)
  end
  
  it "should require a description" do
    lambda do
      proj = Project.create(:description => nil)
      proj.errors.on(:description).should_not be_nil
    end.should_not change(Project, :count)
  end
  
  it "should require an event_date" do
    lambda do
      proj = Project.create(:event_date => nil)
      proj.errors.on(:event_date).should_not be_nil
    end.should_not change(Project, :count)
  end
  

  it "can have many contacts" do
    projects(:no_contact).contacts.should be_empty
    projects(:no_contact).contacts << contacts(:default)
    projects(:no_contact).contacts.should_not be_empty
    projects(:no_contact).contacts.first.should == contacts(:default)
  end
  
  it "can have many tasks" do
    projects(:no_tasks).tasks.should be_empty
    projects(:no_tasks).tasks << tasks(:projectless)
    projects(:no_tasks).tasks.should_not be_empty
    projects(:no_tasks).tasks.first.should == tasks(:projectless)
  end
  
  it "should be completed if all tasks are completed" do
    projects(:complete).complete?.should be_true
  end
  
  it "should be incomplete if any task is not complete" do
    projects(:incomplete).complete?.should_not be_true
  end
  
  it "should be incomplete if there are no tasks" do
    projects(:no_tasks).complete?.should_not be_true
  end
  
end
