require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe TypesController do
  describe "route generation" do
    it "should map #index" do
      route_for(:controller => "types", :action => "index").should == "/types"
    end
  
    it "should map #new" do
      route_for(:controller => "types", :action => "new").should == "/types/new"
    end
  
    it "should map #show" do
      route_for(:controller => "types", :action => "show", :id => 1).should == "/types/1"
    end
  
    it "should map #edit" do
      route_for(:controller => "types", :action => "edit", :id => 1).should == "/types/1/edit"
    end
  
    it "should map #update" do
      route_for(:controller => "types", :action => "update", :id => 1).should == "/types/1"
    end
  
    it "should map #destroy" do
      route_for(:controller => "types", :action => "destroy", :id => 1).should == "/types/1"
    end
  end

  describe "route recognition" do
    it "should generate params for #index" do
      params_from(:get, "/types").should == {:controller => "types", :action => "index"}
    end
  
    it "should generate params for #new" do
      params_from(:get, "/types/new").should == {:controller => "types", :action => "new"}
    end
  
    it "should generate params for #create" do
      params_from(:post, "/types").should == {:controller => "types", :action => "create"}
    end
  
    it "should generate params for #show" do
      params_from(:get, "/types/1").should == {:controller => "types", :action => "show", :id => "1"}
    end
  
    it "should generate params for #edit" do
      params_from(:get, "/types/1/edit").should == {:controller => "types", :action => "edit", :id => "1"}
    end
  
    it "should generate params for #update" do
      params_from(:put, "/types/1").should == {:controller => "types", :action => "update", :id => "1"}
    end
  
    it "should generate params for #destroy" do
      params_from(:delete, "/types/1").should == {:controller => "types", :action => "destroy", :id => "1"}
    end
  end
end
