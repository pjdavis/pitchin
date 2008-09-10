require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/roles/index.html.erb" do
  include RolesHelper
  
  before(:each) do
    assigns[:roles] = [
      stub_model(Role,
        :name => "value for name",
        :description => "value for description"
      ),
      stub_model(Role,
        :name => "value for name",
        :description => "value for description"
      )
    ]
  end

  it "should render list of roles" do
    render "/roles/index.html.erb"
    response.should have_tag("tr>td", "value for name", 2)
    response.should have_tag("tr>td", "value for description", 2)
  end
end

