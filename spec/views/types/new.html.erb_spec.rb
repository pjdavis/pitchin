require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/types/new.html.erb" do
  include TypesHelper
  
  before(:each) do
    assigns[:type] = stub_model(Type,
      :new_record? => true,
      :name => "value for name"
    )
  end

  it "should render new form" do
    render "/types/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", types_path) do
      with_tag("input#type_name[name=?]", "type[name]")
    end
  end
end


