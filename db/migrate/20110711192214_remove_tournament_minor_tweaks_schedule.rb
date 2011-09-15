class RemoveTournamentMinorTweaksSchedule < ActiveRecord::Migration
  def self.up
    #remove_column :schedules, :is_league_run
    #remove_column :schedules, :team_event_name
    #remove_column :schedules, :is_tournament
    #remove_column :schedules, :tournament_id
  end

  def self.down
    #add_column :schedules, :is_league_run, :boolean
    #add_column :schedules, :team_event_name, :string
    #add_column :schedules, :is_tournament, :boolean
    #add_column :schedules, :tournament_id, :integer
  end
end