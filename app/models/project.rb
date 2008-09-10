class Project < ActiveRecord::Base
  
  has_many :project_contacts
  has_many :contacts, :through => :project_contacts
  has_many :tasks
  
  validates_presence_of :name
  validates_presence_of :description
  validates_presence_of :event_date
  
  def complete?
    return false if tasks.empty?
    for task in tasks
      return false if !task.completed?
    end
    return true
  end
end
