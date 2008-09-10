require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/tasks/index.html.erb" do
  include TasksHelper
  
  before(:each) do
    assigns[:tasks] = [
      stub_model(Task,
        :name => "value for name"
      ),
      stub_model(Task,
        :name => "value for name"
      )
    ]
  end

  it "should render list of tasks" do
    render "/tasks/index.html.erb"
    response.should have_tag("tr>td", "value for name", 2)
  end
end

