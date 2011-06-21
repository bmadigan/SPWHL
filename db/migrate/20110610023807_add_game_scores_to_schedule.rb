class AddGameScoresToSchedule < ActiveRecord::Migration
  def self.up
    def self.up
      add_column :schedules, :home_team_score, :integer
      add_column :schedules, :away_team_score, :integer
      add_column :schedules, :add_to_standings, :boolean
    end

    def self.down
      remove_column :schedules, :home_team_score
      remove_column :schedules, :away_team_score
      remove_column :schedules, :add_to_standings
    end
  end

  def self.down
  end
end
