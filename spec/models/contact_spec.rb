require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Contact do
  
  define_models 
  
  before(:each) do
    @valid_attributes = {
      :first_name => "value for first_name",
      :last_name => "value for last_name",
      :work_phone => "value for work_phone",
      :mobile_phone => "value for mobile_phone",
      :home_phone => "value for home_phone",
      :email1 => "value for email1",
      :email2 => "value for email2"
    }
  end

  it "should create a new instance given valid attributes" do
    Contact.create!(@valid_attributes)
  end
  
end
