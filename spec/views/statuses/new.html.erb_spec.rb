require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/statuses/new.html.erb" do
  include StatusesHelper
  
  before(:each) do
    assigns[:status] = stub_model(Status,
      :new_record? => true,
      :completed => false,
      :name => "value for name"
    )
  end

  it "should render new form" do
    render "/statuses/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", statuses_path) do
      with_tag("input#status_completed[name=?]", "status[completed]")
      with_tag("input#status_name[name=?]", "status[name]")
    end
  end
end


