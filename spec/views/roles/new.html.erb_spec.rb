require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/roles/new.html.erb" do
  include RolesHelper
  
  before(:each) do
    assigns[:role] = stub_model(Role,
      :new_record? => true,
      :name => "value for name",
      :description => "value for description"
    )
  end

  it "should render new form" do
    render "/roles/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", roles_path) do
      with_tag("input#role_name[name=?]", "role[name]")
      with_tag("textarea#role_description[name=?]", "role[description]")
    end
  end
end


