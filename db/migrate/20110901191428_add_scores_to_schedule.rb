class AddScoresToSchedule < ActiveRecord::Migration
  def self.up
    add_column :schedules, :home_team_score, :integer
    add_column :schedules, :away_team_score, :integer
    add_column :schedules, :set_standings, :boolean
  end

  def self.down
    remove_column :schedules, :home_team_score
    remove_column :schedules, :away_team_score
    remove_column :schedules, :set_standings
  end
end
