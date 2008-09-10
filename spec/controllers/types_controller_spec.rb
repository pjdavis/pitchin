require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe TypesController do

  def mock_type(stubs={})
    @mock_type ||= mock_model(Type, stubs)
  end
  
  describe "responding to GET index" do

    it "should expose all types as @types" do
      Type.should_receive(:find).with(:all).and_return([mock_type])
      get :index
      assigns[:types].should == [mock_type]
    end

    describe "with mime type of xml" do
  
      it "should render all types as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Type.should_receive(:find).with(:all).and_return(types = mock("Array of Types"))
        types.should_receive(:to_xml).and_return("generated XML")
        get :index
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "responding to GET show" do

    it "should expose the requested type as @type" do
      Type.should_receive(:find).with("37").and_return(mock_type)
      get :show, :id => "37"
      assigns[:type].should equal(mock_type)
    end
    
    describe "with mime type of xml" do

      it "should render the requested type as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Type.should_receive(:find).with("37").and_return(mock_type)
        mock_type.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37"
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "responding to GET new" do
  
    it "should expose a new type as @type" do
      Type.should_receive(:new).and_return(mock_type)
      get :new
      assigns[:type].should equal(mock_type)
    end

  end

  describe "responding to GET edit" do
  
    it "should expose the requested type as @type" do
      Type.should_receive(:find).with("37").and_return(mock_type)
      get :edit, :id => "37"
      assigns[:type].should equal(mock_type)
    end

  end

  describe "responding to POST create" do

    describe "with valid params" do
      
      it "should expose a newly created type as @type" do
        Type.should_receive(:new).with({'these' => 'params'}).and_return(mock_type(:save => true))
        post :create, :type => {:these => 'params'}
        assigns(:type).should equal(mock_type)
      end

      it "should redirect to the created type" do
        Type.stub!(:new).and_return(mock_type(:save => true))
        post :create, :type => {}
        response.should redirect_to(type_url(mock_type))
      end
      
    end
    
    describe "with invalid params" do

      it "should expose a newly created but unsaved type as @type" do
        Type.stub!(:new).with({'these' => 'params'}).and_return(mock_type(:save => false))
        post :create, :type => {:these => 'params'}
        assigns(:type).should equal(mock_type)
      end

      it "should re-render the 'new' template" do
        Type.stub!(:new).and_return(mock_type(:save => false))
        post :create, :type => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "responding to PUT udpate" do

    describe "with valid params" do

      it "should update the requested type" do
        Type.should_receive(:find).with("37").and_return(mock_type)
        mock_type.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :type => {:these => 'params'}
      end

      it "should expose the requested type as @type" do
        Type.stub!(:find).and_return(mock_type(:update_attributes => true))
        put :update, :id => "1"
        assigns(:type).should equal(mock_type)
      end

      it "should redirect to the type" do
        Type.stub!(:find).and_return(mock_type(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(type_url(mock_type))
      end

    end
    
    describe "with invalid params" do

      it "should update the requested type" do
        Type.should_receive(:find).with("37").and_return(mock_type)
        mock_type.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :type => {:these => 'params'}
      end

      it "should expose the type as @type" do
        Type.stub!(:find).and_return(mock_type(:update_attributes => false))
        put :update, :id => "1"
        assigns(:type).should equal(mock_type)
      end

      it "should re-render the 'edit' template" do
        Type.stub!(:find).and_return(mock_type(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "responding to DELETE destroy" do

    it "should destroy the requested type" do
      Type.should_receive(:find).with("37").and_return(mock_type)
      mock_type.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "should redirect to the types list" do
      Type.stub!(:find).and_return(mock_type(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(types_url)
    end

  end

end
