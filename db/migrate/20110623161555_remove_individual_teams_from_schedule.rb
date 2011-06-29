class RemoveIndividualTeamsFromSchedule < ActiveRecord::Migration
  def self.up
    remove_column :schedules, :is_league_run
    remove_column :schedules, :team_event_name
  end

  def self.down
    add_column :schedules, :is_league_run, :boolean
    add_column :schedules, :team_event_name, :string
  end
end
