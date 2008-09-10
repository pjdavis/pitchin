ModelStubbing.define_models do
  
  model Contact do
    # t.string   "first_name"
    # t.string   "last_name"
    # t.string   "work_phone"
    # t.string   "mobile_phone"
    # t.string   "home_phone"
    # t.string   "email1"
    # t.string   "email2"
    
    stub :first_name => Faker::Name.first_name,
         :last_name => Faker::Name.last_name,
         :work_phone => rand(9999999999).to_s,
         :mobile_phone => rand(99999999999).to_s,
         :home_phone => rand(9999999999).to_s,
         :email1 => Faker::Internet.email,
         :email2 => Faker::Internet.free_email
  end
  
  model Project do
    # t.string   "name"
    # t.string   "description"
    # t.text     "details"
    # t.string   "location"
    # t.integer  "contact_id"
    # t.datetime "event_date"
    
    stub :name => Faker::Lorem.words.join(" "), 
         :description => Faker::Lorem.sentence, 
         :details => Faker::Lorem.paragraph(5), 
         :location => Faker::Address.city,
         :event_date => Time.now.next_week
         
    stub :no_contact
    stub :complete
    stub :incomplete
    stub :no_tasks
    
  end
  
  model User do
    stub :login => 'normal-user', 
         :email => 'normal-user@example.com',
         :salt => '7e3041ebc2fc05a40c60028e2c4901a81035d3cd', 
         :crypted_password => '00742970dc9e6319f8019fd54864d3ea740f04b1'
    
    stub  :quentin,
          :login => "quentin",
          :email => "quentin@example.com",
          :created_at => 5.days.ago
          
    stub  :aaron,
          :login => "aaron",
          :email => "aaron@example.com",
          :created_at => 1.days.ago
          
    stub :with_types
  end
  
  model Role do
    stub  :name => Faker::Lorem.words(1).to_s,
          :description => Faker::Lorem.words.join(" ")
  end
  
  model Status do
    stub :name => Faker::Lorem.words(1).to_s,
         :completed => false
    stub :completed,
         :name => Faker::Lorem.words(1).to_s,
         :completed => true
  end
  
  model Task do
    
    stub  :project => projects(:default),
          :name => Faker::Lorem.words.join(" "), 
          :requestor => users(:default),
          :due_at => Time.now.next_week,
          :expires_at => Time.now.next_month,
          :status => statuses(:default)
          
    stub  :another_incomplete_task,
          :project => projects(:incomplete)
          
    stub  :completed_task,
          :project => projects(:default),
          :status => statuses(:completed)
          
    stub  :another_complete_task,
          :project => projects(:complete),
          :status => statuses(:completed)

    stub  :projectless,
          :project_id => nil
          
    stub  :type_one
    stub  :type_two
    stub  :type_three
  end
  
  model Type do
    stub  :name => Faker::Lorem.words(1).to_s
    stub  :type_one
    stub  :type_two
    stub  :type_three
  end
  
  model TaskType do
    stub  :task => tasks(:type_one),
          :type => types(:type_one)
    stub  :type_two,
          :task => tasks(:type_two),
          :type => types(:type_two)
    stub  :type_three,
          :task => tasks(:type_three),
          :type => types(:type_three)
  end
  
  model UserType do
    stub  :user => users(:with_types),
          :type => types(:type_one)
    stub  :type_two,
          :user => users(:with_types),
          :type => types(:type_two)
  end
  
  model Role do
    stub  :name => Faker::Lorem.words(1).to_s
    stub  :no_rights,
          :name => Faker::Lorem.words(1).to_s
  end
  
  model Right do
    stub  :controller => "Spec::Rails::Example::HelperExampleGroupController",
          :action => "request"
  end
  
  model RoleRight do
    stub  :role => roles(:default),
          :right => rights(:default)
  end
end