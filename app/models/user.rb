class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable, :validatable, :registerable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :username, :name, :email, :password, :password_confirmation, :remember_me, :role_type
  
  validates :username, :presence => true
  validates :name, :presence => true
  validates :email, :presence => true
  validates :password, :presence => true
  
  has_one :league, :foreign_key => 'director_id', :class_name => 'League'
  has_one :team, :foreign_key => 'manager_id', :class_name => 'Team'
  
  default_scope :order => "name"
  
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
  
  def executive?
    if role_type == 'Executive'
      return true
    end
  end
  
  def webmaster?
    if role_type == 'God'
      return true
    end
  end
end
