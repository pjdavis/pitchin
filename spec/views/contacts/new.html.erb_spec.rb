require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/contacts/new.html.erb" do
  include ContactsHelper
  
  before(:each) do
    assigns[:contact] = stub_model(Contact,
      :new_record? => true,
      :first_name => "value for first_name",
      :last_name => "value for last_name",
      :work_phone => "value for work_phone",
      :mobile_phone => "value for mobile_phone",
      :home_phone => "value for home_phone",
      :email1 => "value for email1",
      :email2 => "value for email2"
    )
  end

  it "should render new form" do
    render "/contacts/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", contacts_path) do
      with_tag("input#contact_first_name[name=?]", "contact[first_name]")
      with_tag("input#contact_last_name[name=?]", "contact[last_name]")
      with_tag("input#contact_work_phone[name=?]", "contact[work_phone]")
      with_tag("input#contact_mobile_phone[name=?]", "contact[mobile_phone]")
      with_tag("input#contact_home_phone[name=?]", "contact[home_phone]")
      with_tag("input#contact_email1[name=?]", "contact[email1]")
      with_tag("input#contact_email2[name=?]", "contact[email2]")
    end
  end
end


