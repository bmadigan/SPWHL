class Standings < ActiveRecord::Base
  belongs_to :league
  belongs_to :hometeam_score, :foreign_key => 'home_team_score', :class_name => 'Team'
  belongs_to :awayteam_score, :foreign_key => 'away_team_score', :class_name => 'Team'
  
  attr_accessible :league_id, :game_id, :home_team_score, :away_team_score
end
