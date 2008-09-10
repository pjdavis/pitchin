class Task < ActiveRecord::Base
  
  belongs_to :project
  belongs_to :requestor, :class_name => "User", :foreign_key => "requestor_id"
  belongs_to :status
  
  has_many :assignments
  has_many :users, :through => :assignments
  
  validates_presence_of :due_at
  validates_presence_of :requested_at
  validates_presence_of :name
  validates_presence_of :requestor_id
  
  def validate
    if requested_at && due_at > requested_at
      errors.add(:due_at, "must be after requested date.")
    end
  end
  
  def completed?
    status ? status.completed? : false
  end
  
  def assigned_to?(user)
    return true if Assignment.exists?(:user_id => user.id, :task_id => self.id)
    return false
  end
end
