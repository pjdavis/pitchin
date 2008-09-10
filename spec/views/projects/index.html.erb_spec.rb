require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/projects/index.html.erb" do
  include ProjectsHelper
  
  before(:each) do
    assigns[:projects] = [
      stub_model(Project,
        :name => "value for name",
        :description => "value for description",
        :details => "value for details",
        :location => "value for location"
      ),
      stub_model(Project,
        :name => "value for name",
        :description => "value for description",
        :details => "value for details",
        :location => "value for location"
      )
    ]
  end

  it "should render list of projects" do
    render "/projects/index.html.erb"
    response.should have_tag("tr>td", "value for name", 2)
    response.should have_tag("tr>td", "value for description", 2)
    response.should have_tag("tr>td", "value for details", 2)
    response.should have_tag("tr>td", "value for location", 2)
  end
end

