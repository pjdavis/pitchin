require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/contacts/show.html.erb" do
  include ContactsHelper
  
  before(:each) do
    assigns[:contact] = @contact = stub_model(Contact,
      :first_name => "value for first_name",
      :last_name => "value for last_name",
      :work_phone => "value for work_phone",
      :mobile_phone => "value for mobile_phone",
      :home_phone => "value for home_phone",
      :email1 => "value for email1",
      :email2 => "value for email2"
    )
  end

  it "should render attributes in <p>" do
    render "/contacts/show.html.erb"
    response.should have_text(/value\ for\ first_name/)
    response.should have_text(/value\ for\ last_name/)
    response.should have_text(/value\ for\ work_phone/)
    response.should have_text(/value\ for\ mobile_phone/)
    response.should have_text(/value\ for\ home_phone/)
    response.should have_text(/value\ for\ email1/)
    response.should have_text(/value\ for\ email2/)
  end
end

