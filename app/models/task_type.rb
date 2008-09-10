class TaskType < ActiveRecord::Base

  belongs_to :task
  belongs_to :type
  
  validates_presence_of :task_id
  validates_presence_of :type_id

end
