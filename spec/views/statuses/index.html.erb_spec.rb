require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/statuses/index.html.erb" do
  include StatusesHelper
  
  before(:each) do
    assigns[:statuses] = [
      stub_model(Status,
        :completed => false,
        :name => "value for name"
      ),
      stub_model(Status,
        :completed => false,
        :name => "value for name"
      )
    ]
  end

  it "should render list of statuses" do
    render "/statuses/index.html.erb"
    response.should have_tag("tr>td", "false", 2)
    response.should have_tag("tr>td", "value for name", 2)
  end
end

