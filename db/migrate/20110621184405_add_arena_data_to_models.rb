class AddArenaDataToModels < ActiveRecord::Migration
  def self.up
    add_column :schedules, :arena_id, :integer
  end

  def self.down
    drop_column :schedules, :arena_id
  end
end
