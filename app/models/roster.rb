class Roster < ActiveRecord::Base
  belongs_to :team
  
  attr_accessible :team_id, :first_name, :last_name, :position, :jersey_number
  
  after_initialize :init

  def init
    self.jersey_number  ||= 'na'           #will set the default value only if it's nil
    
  end
  
  def full_name
    "#{first_name} #{last_name}"
  end
end
