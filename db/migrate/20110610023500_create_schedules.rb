class CreateSchedules < ActiveRecord::Migration
  def self.up
    create_table :schedules do |t|
      t.integer :league_id
      
      t.integer :home_team_id
      
      t.integer :away_team_id
      t.boolean :is_game
      t.boolean :is_draft_game
      t.boolean :is_league_run
      t.string :team_event_name
      t.datetime :scheduled_date
      t.boolean :is_tournament
      t.integer :tournament_id
      t.timestamps
    end
  end

  def self.down
    drop_table :schedules
  end
end
