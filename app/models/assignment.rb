class Assignment < ActiveRecord::Base
  
  belongs_to :task
  belongs_to :user
  
  validates_presence_of :task_id
  validates_presence_of :user_id
  
end
