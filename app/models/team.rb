class Team < ActiveRecord::Base
  belongs_to :league
  has_many :rosters, :dependent => :destroy
  has_many :schedules, :dependent => :destroy
  belongs_to :manager, :class_name => "User", :foreign_key => "manager_id"
  
  has_many :home_matches, :foreign_key => :home_team_id, :class_name => :schedules
  has_many :away_matches, :foreign_key => :away_team_id, :class_name => :schedules
   
  attr_accessible :name, :league_id, :manager_id, :team_page_content, :goals_for, :goals_against, :wins, :loses, :ties
  
  validates :name, :presence => true
  validates :manager_id, :presence => true
  validates :league_id, :presence => true
  
  def upcoming_league_schedule                                        
    Schedule.where("DATE(scheduled_date) >= ? AND (home_team_id = ? OR away_team_id = ?)", Date.today, id, id).order("scheduled_date ASC").limit(3)
  end                                                                 
  
  def upcoming_team_schedule
    TeamSchedule.where("DATE(event_date) >= ? AND team_id = ?", Date.today, id).order("event_date ASC").limit(3)
  end
  
  def full_schedule
    Schedule.where("home_team_id = ? OR away_team_id = ?", id, id).order("scheduled_date ASC")
  end
  
  def full_team_schedule
    TeamSchedule.where("DATE(event_date) >= ? AND team_id = ?", Date.today, id).order("event_date ASC")
  end
  
  def self.total_pts 
    #count(('wins' * 2) + 'ties')
    pts = wins * 2
    pts = ties + pts
    pts
  end
  
  def self.select_by_standings(league)
    #select (*, ((wins * 2) +ties) as total_pts).where("league_id = ?", league.id).order("total_pts DESC")
    self.connection.execute(sanitize_sql(["SELECT name, goals_for, goals_against, wins, loses, ties, ((wins * 2) + ties) as total_pts, (wins + loses + ties) as gp FROM teams WHERE league_id = ? ORDER BY total_pts DESC", league]))
  end
  
  def update_team_standings(team_score, opp_score)
    if(team_score == opp_score)
      ties = self.ties + 1
    else
      ties = self.ties
    end
    if(team_score > opp_score)
      wins = self.wins + 1
    else
      wins = self.wins
    end
    if(team_score < opp_score)
      loses = self.loses + 1
    else
      loses = self.loses
    end
    
    gf = self.goals_for + team_score
    ga = self.goals_against + opp_score
    
    self.ties = ties
    self.wins = wins
    self.loses = loses
    self.goals_for = gf
    self.goals_against = ga
    
    self.save!
  end
  
  #scope :todays_games, lambda { where("DATE(scheduled_date) = ?", Date.today).order("TIME(scheduled_date) ASC") }
  
end
