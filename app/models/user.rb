class User < ActiveRecord::Base
# Connects this user object to Blacklights Bookmarks and Folders. 
 include Blacklight::User
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :login,  :password, :password_confirmation, :remember_me, :approved, :admin
  attr_accessible :username
  
  attr_accessor :login
  
  
  
  def active_for_authentication? 
    super && approved? 
  end 

  def inactive_message 
    if !approved? 
      :not_approved 
    else 
      super # Use whatever other message 
    end 
  end
  
  protected
  
  # I don't think this is being used. 
  #def make_admin
  #   self.update_attribute :admin, true
  # end
   
   def password_required? 
     false 
   end
  
  # this was for email or user id login, but we're no longer using this. We're using email only. 
  #def self.find_for_database_authentication(warden_conditions)
  #   conditions = warden_conditions.dup
  #   login = conditions.delete(:login)
  #   where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
  # end
   
  
  
end
