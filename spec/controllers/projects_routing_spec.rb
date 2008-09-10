require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ProjectsController do
  describe "route generation" do
    it "should map #index" do
      route_for(:controller => "projects", :action => "index").should == "/projects"
    end
  
    it "should map #new" do
      route_for(:controller => "projects", :action => "new").should == "/projects/new"
    end
  
    it "should map #show" do
      route_for(:controller => "projects", :action => "show", :id => 1).should == "/projects/1"
    end
  
    it "should map #edit" do
      route_for(:controller => "projects", :action => "edit", :id => 1).should == "/projects/1/edit"
    end
  
    it "should map #update" do
      route_for(:controller => "projects", :action => "update", :id => 1).should == "/projects/1"
    end
  
    it "should map #destroy" do
      route_for(:controller => "projects", :action => "destroy", :id => 1).should == "/projects/1"
    end
  end

  describe "route recognition" do
    it "should generate params for #index" do
      params_from(:get, "/projects").should == {:controller => "projects", :action => "index"}
    end
  
    it "should generate params for #new" do
      params_from(:get, "/projects/new").should == {:controller => "projects", :action => "new"}
    end
  
    it "should generate params for #create" do
      params_from(:post, "/projects").should == {:controller => "projects", :action => "create"}
    end
  
    it "should generate params for #show" do
      params_from(:get, "/projects/1").should == {:controller => "projects", :action => "show", :id => "1"}
    end
  
    it "should generate params for #edit" do
      params_from(:get, "/projects/1/edit").should == {:controller => "projects", :action => "edit", :id => "1"}
    end
  
    it "should generate params for #update" do
      params_from(:put, "/projects/1").should == {:controller => "projects", :action => "update", :id => "1"}
    end
  
    it "should generate params for #destroy" do
      params_from(:delete, "/projects/1").should == {:controller => "projects", :action => "destroy", :id => "1"}
    end
  end
end
