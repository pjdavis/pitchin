class Type < ActiveRecord::Base
  
  has_many :user_types
  has_many :users, :through => :user_types
  
  has_many :task_types
  has_many :tasks, :through => :task_types
  
  validates_presence_of :name
end
