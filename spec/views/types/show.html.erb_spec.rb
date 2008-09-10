require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/types/show.html.erb" do
  include TypesHelper
  
  before(:each) do
    assigns[:type] = @type = stub_model(Type,
      :name => "value for name"
    )
  end

  it "should render attributes in <p>" do
    render "/types/show.html.erb"
    response.should have_text(/value\ for\ name/)
  end
end

