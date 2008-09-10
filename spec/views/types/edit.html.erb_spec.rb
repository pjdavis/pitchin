require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/types/edit.html.erb" do
  include TypesHelper
  
  before(:each) do
    assigns[:type] = @type = stub_model(Type,
      :new_record? => false,
      :name => "value for name"
    )
  end

  it "should render edit form" do
    render "/types/edit.html.erb"
    
    response.should have_tag("form[action=#{type_path(@type)}][method=post]") do
      with_tag('input#type_name[name=?]', "type[name]")
    end
  end
end


