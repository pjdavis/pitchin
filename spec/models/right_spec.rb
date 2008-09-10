require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Right do
  before(:each) do
  end
  
  it "should have a controller" do
    lambda do
      right = Right.create(:controller => nil)
      right.errors.on(:controller).should_not be_nil
    end.should_not change(Right, :count)
  end
  
  it "should have an action" do
    lambda do
      right = Right.create(:action => nil)
      right.errors.on(:action).should_not be_nil
    end.should_not change(Right, :count)
  end
  
  it "should be valid with a valid controller and action" do
    right = Right.create(:controller => "Spec::Rails::Example::HelperExampleGroupController", :action => "request")
    right.should be_valid
  end
  
  it "should be invalide given invalid controller" do
    right = Right.create(:controller => "fake", :action => "request")
    right.should_not be_valid
  end
  
  it "should be invalid given an invalid action" do
    right = Right.create(:controller => "Spec::Rails::Example::HelperExampleGroupController", :action => "fake")
    right.should_not be_valid
  end
  
end
