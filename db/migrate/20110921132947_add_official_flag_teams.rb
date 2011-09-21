class AddOfficialFlagTeams < ActiveRecord::Migration
  def self.up
    add_column :teams, :is_official, :boolean, :default => true
  end

  def self.down
    remove_column :teams, :is_official
  end
end
