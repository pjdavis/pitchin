class UserType < ActiveRecord::Base
  
  belongs_to :user
  belongs_to :type
  
  validates_presence_of :user_id
  validates_presence_of :type_id
  
end
