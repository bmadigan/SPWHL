class Roster < ActiveRecord::Base
  belongs_to :team
  
  attr_accessible :team_id, :first_name, :last_name, :position, :jersey_number
  
  
  def full_name
    "#{first_name} #{last_name}"
  end
end
