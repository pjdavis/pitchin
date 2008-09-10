class Comment < ActiveRecord::Base
  
  belongs_to :user
  belongs_to :task
  
  validates_presence_of :user_id
  validates_presence_of :task_id
  validates_presence_of :content
  
end
