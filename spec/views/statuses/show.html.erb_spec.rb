require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/statuses/show.html.erb" do
  include StatusesHelper
  
  before(:each) do
    assigns[:status] = @status = stub_model(Status,
      :completed => false,
      :name => "value for name"
    )
  end

  it "should render attributes in <p>" do
    render "/statuses/show.html.erb"
    response.should have_text(/als/)
    response.should have_text(/value\ for\ name/)
  end
end

