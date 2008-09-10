class Contact < ActiveRecord::Base
  
  has_many :project_contacts
  has_many :projects, :through => :project_contacts
  
end
