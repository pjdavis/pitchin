require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Comment do
  before(:each) do
    @valid_attributes = {
      :content => "value for content",
      :user_id => "1",
      :task_id => "1"
    }
  end

  it "should create a new instance given valid attributes" do
    Comment.create!(@valid_attributes)
  end
  
  it "should have content" do
    lambda do
      com = Comment.create(:content => nil)
      com.errors.on(:content).should_not be_nil
    end.should_not change(Comment, :count)
  end
  
  it "should have a user" do
    lambda do
      com = Comment.create(:user_id => nil)
      com.errors.on(:user_id).should_not be_nil
    end.should_not change(Comment, :count)
  end
  
  it "should have a task" do
    lambda do
      com = Comment.create(:task_id => nil)
      com.errors.on(:task_id).should_not be_nil
    end.should_not change(Comment, :count)
  end
end
