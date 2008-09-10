require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/projects/edit.html.erb" do
  include ProjectsHelper
  
  before(:each) do
    assigns[:project] = @project = stub_model(Project,
      :new_record? => false,
      :name => "value for name",
      :description => "value for description",
      :details => "value for details",
      :location => "value for location"
    )
  end

  it "should render edit form" do
    render "/projects/edit.html.erb"
    
    response.should have_tag("form[action=#{project_path(@project)}][method=post]") do
      with_tag('input#project_name[name=?]', "project[name]")
      with_tag('input#project_description[name=?]', "project[description]")
      with_tag('textarea#project_details[name=?]', "project[details]")
      with_tag('input#project_location[name=?]', "project[location]")
    end
  end
end


