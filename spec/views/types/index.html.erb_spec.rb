require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/types/index.html.erb" do
  include TypesHelper
  
  before(:each) do
    assigns[:types] = [
      stub_model(Type,
        :name => "value for name"
      ),
      stub_model(Type,
        :name => "value for name"
      )
    ]
  end

  it "should render list of types" do
    render "/types/index.html.erb"
    response.should have_tag("tr>td", "value for name", 2)
  end
end

