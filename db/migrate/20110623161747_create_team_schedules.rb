class CreateTeamSchedules < ActiveRecord::Migration
  def self.up
    create_table :team_schedules do |t|
      t.integer :team_id
      t.datetime :event_date
      t.string :event_title
      t.text :event_content
      t.timestamps
    end
  end

  def self.down
    drop_table :team_schedules
  end
end
