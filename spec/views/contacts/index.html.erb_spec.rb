require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/contacts/index.html.erb" do
  include ContactsHelper
  
  before(:each) do
    assigns[:contacts] = [
      stub_model(Contact,
        :first_name => "value for first_name",
        :last_name => "value for last_name",
        :work_phone => "value for work_phone",
        :mobile_phone => "value for mobile_phone",
        :home_phone => "value for home_phone",
        :email1 => "value for email1",
        :email2 => "value for email2"
      ),
      stub_model(Contact,
        :first_name => "value for first_name",
        :last_name => "value for last_name",
        :work_phone => "value for work_phone",
        :mobile_phone => "value for mobile_phone",
        :home_phone => "value for home_phone",
        :email1 => "value for email1",
        :email2 => "value for email2"
      )
    ]
  end

  it "should render list of contacts" do
    render "/contacts/index.html.erb"
    response.should have_tag("tr>td", "value for first_name", 2)
    response.should have_tag("tr>td", "value for last_name", 2)
    response.should have_tag("tr>td", "value for work_phone", 2)
    response.should have_tag("tr>td", "value for mobile_phone", 2)
    response.should have_tag("tr>td", "value for home_phone", 2)
    response.should have_tag("tr>td", "value for email1", 2)
    response.should have_tag("tr>td", "value for email2", 2)
  end
end

