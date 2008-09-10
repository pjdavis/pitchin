class Right < ActiveRecord::Base
  
  has_many :role_rights
  has_many :roles, :through => :role_rights
  
  validates_presence_of :controller
  validates_presence_of :action
  
  def self.add_rights_to_database
    for controller in ApplicationController.subclasses
      for method in eval(controller).public_instance_methods(false)
        Right.create(:controller => controller.to_s,
                     :action => method.to_s)
      end
    end
  end
  
  private
  
  def validate
    unless controller.blank?
      if ApplicationController.subclasses.include?(controller)
        unless action.blank?
          unless eval(controller).public_instance_methods(false).include?(action)
            errors.add(:action, "must be an avaliable action")
          end
        end
      else
        errors.add(:controller, "must be an avaliable controller")
      end
    end
  end
end
