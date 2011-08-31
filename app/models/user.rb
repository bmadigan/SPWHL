class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable, :validatable, :registerable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :username, :name, :email, :password, :password_confirmation, :remember_me, :role_type
  
  def manager?
    if role_type == 'Manager'
      return true
    end
  end
  
  def director?
    if role_type == 'Director'
      return true
    end
  end
  
  def webmaster?
    if role_type == 'God'
      return true
    end
  end
end
