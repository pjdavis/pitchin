class RoleRight < ActiveRecord::Base
  
  belongs_to :role
  belongs_to :right
  
  validates_presence_of :role_id
  validates_presence_of :right_id
  
end
