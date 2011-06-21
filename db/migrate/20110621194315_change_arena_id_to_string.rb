class ChangeArenaIdToString < ActiveRecord::Migration
  def self.up
    remove_column :schedules, :arena_id
    add_column :schedules, :arena, :string
  end

  def self.down
    remove_column :schedules, :arena
    add_column :schedules, :arena_id, :integer
  end
end
