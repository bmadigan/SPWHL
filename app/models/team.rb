class Team < ActiveRecord::Base
  belongs_to :league
  has_many :rosters
  
  attr_accessible :name, :league_id, :manager_id, :team_page_content
  
  
  
end
