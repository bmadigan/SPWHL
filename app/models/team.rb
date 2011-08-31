class Team < ActiveRecord::Base
  belongs_to :league
  has_many :rosters, :dependent => :destroy
  has_many :schedules, :dependent => :destroy
  belongs_to :manager, :class_name => "User", :foreign_key => "manager_id"
  
  
  attr_accessible :name, :league_id, :manager_id, :team_page_content
  
  def upcoming_league_schedule
    Schedule.where("DATE(scheduled_date) >= ? AND (home_team_id = ? OR away_team_id = ?)", Date.today, id, id).order("Time(scheduled_date) ASC").limit(3)
  end
  
  
  #scope :todays_games, lambda { where("DATE(scheduled_date) = ?", Date.today).order("TIME(scheduled_date) ASC") }
  
end
