class AddStatusChangeSchedules < ActiveRecord::Migration
  def self.up
    add_column :schedules, :display_change, :boolean
  end

  def self.down
    remove_column :schedules, :display_change
  end
end
