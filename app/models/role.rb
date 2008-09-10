class Role < ActiveRecord::Base
  
  has_many :permissions
  has_many :users, :through => :permissions
  
  has_many :role_rights
  has_many :rights, :through => :role_rights
  
  validates_presence_of :name
end
