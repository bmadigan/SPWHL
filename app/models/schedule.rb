class Schedule < ActiveRecord::Base
  belongs_to :league
  belongs_to :home_team,
             :class_name => "Team",
             :foreign_key => "home_team_id"
  belongs_to :away_team,
             :class_name => "Team",
             :foreign_key => "away_team_id"
  
  attr_accessible :league_id, :arena, :home_team_id, :away_team_id, :is_game, :is_draft_game, 
                  :is_league_run, :team_event_name, :scheduled_date, :is_tournament, :tournament_id
  
end
