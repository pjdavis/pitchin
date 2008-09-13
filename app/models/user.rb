require 'digest/sha1'
class User < ActiveRecord::Base
  # Virtual attribute for the unencrypted password
  attr_accessor :password
  
  has_many :assignments
  has_many :tasks, :through => :assignments
  
  has_many :permissions
  has_many :roles, :through => :permissions
  
  has_many :user_types
  has_many :types, :through => :user_types
  
  has_many :avaliable_tasks,
           :class_name => "Task",
           :finder_sql => 'SELECT tasks.* from tasks ' +
                          'left join assignments on tasks.id = assignments.task_id ' +
                          'join task_types on task_types.task_id = tasks.id ' +
                          'join types on types.id = task_types.type_id ' +
                          'join user_types on user_types.type_id = types.id and user_types.user_id = #{id} ' +
                          'where assignments.task_id is NULL or assignments.user_id != #{id}; '
                          
  has_many :projects,
           :class_name => "Project",
           :finder_sql => 'SELECT projects.* from projects ' +
                          'left join tasks on tasks.project_id = projects.id ' +
                          'join assignments on assignments.task_id = tasks.id ' +
                          'join users on assignments.user_id = users.id ' +
                          'where users.id = #{id}; '

  validates_presence_of     :login, :email
  validates_presence_of     :password,                   :if => :password_required?
  validates_presence_of     :password_confirmation,      :if => :password_required?
  validates_length_of       :password, :within => 4..40, :if => :password_required?
  validates_confirmation_of :password,                   :if => :password_required?
  validates_length_of       :login,    :within => 3..40
  validates_length_of       :email,    :within => 3..100
  validates_uniqueness_of   :login, :email, :case_sensitive => false
  before_save :encrypt_password
  
  # prevents a user from submitting a crafted form that bypasses activation
  # anything else you want your user to change should be added here.
  attr_accessible :login, :email, :password, :password_confirmation

  # Authenticates a user by their login name and unencrypted password.  Returns the user or nil.
  def self.authenticate(login, password)
    u = find_by_login(login) # need to get the salt
    u && u.authenticated?(password) ? u : nil
  end

  # Encrypts some data with the salt.
  def self.encrypt(password, salt)
    Digest::SHA1.hexdigest("--#{salt}--#{password}--")
  end

  # Encrypts the password with the user salt
  def encrypt(password)
    self.class.encrypt(password, salt)
  end

  def authenticated?(password)
    crypted_password == encrypt(password)
  end

  def remember_token?
    remember_token_expires_at && Time.now.utc < remember_token_expires_at 
  end

  # These create and unset the fields required for remembering users between browser closes
  def remember_me
    remember_me_for 2.weeks
  end

  def remember_me_for(time)
    remember_me_until time.from_now.utc
  end

  def remember_me_until(time)
    self.remember_token_expires_at = time
    self.remember_token            = encrypt("#{email}--#{remember_token_expires_at}")
    save(false)
  end

  def forget_me
    self.remember_token_expires_at = nil
    self.remember_token            = nil
    save(false)
  end

  # Returns true if the user has just been activated.
  def recently_activated?
    @activated
  end

  protected
    # before filter 
    def encrypt_password
      return if password.blank?
      self.salt = Digest::SHA1.hexdigest("--#{Time.now.to_s}--#{login}--") if new_record?
      self.crypted_password = encrypt(password)
    end
      
    def password_required?
      crypted_password.blank? || !password.blank?
    end
    
    
end
