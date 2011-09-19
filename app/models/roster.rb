class Roster < ActiveRecord::Base
  belongs_to :team
  
  attr_accessible :team_id, :first_name, :last_name, :position, :jersey_number
  
  validates :team_id, :presence => true
  validates :first_name, :presence => true
  validates :last_name, :presence => true
  
  def full_name
    "#{first_name} #{last_name}"
  end
end
