require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/roles/edit.html.erb" do
  include RolesHelper
  
  before(:each) do
    assigns[:role] = @role = stub_model(Role,
      :new_record? => false,
      :name => "value for name",
      :description => "value for description"
    )
  end

  it "should render edit form" do
    render "/roles/edit.html.erb"
    
    response.should have_tag("form[action=#{role_path(@role)}][method=post]") do
      with_tag('input#role_name[name=?]', "role[name]")
      with_tag('textarea#role_description[name=?]', "role[description]")
    end
  end
end


