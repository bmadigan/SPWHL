class RenameDisplayChange < ActiveRecord::Migration
  def self.up
    rename_column :schedules, :display_change, :is_change
  end

  def self.down
    rename_column :schedules, :is_change, :display_change
  end
end
