# Email settings
ActionMailer::Base.delivery_method = :smtp

ActionMailer::Base.smtp_settings = {
  :address => "mail.yourapplication.com",
  :port => 25,
  :domain => "yourapplication.com",
  :authentication => :login,
  :user_name => "mail@yourapplication.com",
  :password => "yourapplicationpassword"  
}


