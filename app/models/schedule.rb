class Schedule < ActiveRecord::Base
  # Event Calendar could not get to work
  #has_event_calendar :start_at_field  => 'scheduled_date', :end_at_field => 'scheduled_date'
  
  belongs_to :league
  
  belongs_to :hometeam, :foreign_key => 'home_team_id', :class_name => 'Team'
  belongs_to :awayteam, :foreign_key => 'away_team_id', :class_name => 'Team'
  
  attr_accessible :league_id, :arena, :home_team_id, :away_team_id, :is_game, :is_draft_game, :scheduled_date, :is_change, :home_team_score, :away_team_score, :set_standings, :custom_text
  
  define_easy_dates do  
      format_for :scheduled_date, :format => "%B %e, %Y %I:%M%p"
      format_for :scheduled_date, :format => "%B %e, %Y", :as => "scheduled_day"
      format_for :scheduled_date, :format => "%b %e, %Y", :as => "scheduled_short_date"
      format_for :scheduled_date, :format => "%I:%M%p", :as => "scheduled_time"
  end
  
  default_scope :order => "scheduled_date ASC"
  
  # Uses the Mysql DATE(...) function because scheduled_date is a datetime and we only 
  # Need to check the date portion
  #scope :todays_games, lambda { where("DATE(scheduled_date) = ?", Date.today).order("TIME(scheduled_date) ASC") }
  
  # Get league scheduled games that have been played but not yet been set in standings
  #scope :not_in_standings, lambda { where("DATE(scheduled_date) <= ? AND league_id = ? AND set_standings != ?", Date.today, @league.id, false) }
  
  def self.todays_games
    where("DATE(scheduled_date) = ?", Date.today).order("TIME(scheduled_date) ASC")
  end
  
  def self.not_in_standings(league)
    where("DATE(scheduled_date) <= ? AND league_id = ? AND is_game = ? AND is_draft_game = ? AND set_standings != ?", Date.today, league.id, true, false, true) 
  end
end
