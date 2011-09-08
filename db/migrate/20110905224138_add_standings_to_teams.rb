class AddStandingsToTeams < ActiveRecord::Migration
  def self.up
    add_column :teams, :goals_for, :integer, :default => 0
    add_column :teams, :goals_against, :integer, :default => 0
    add_column :teams, :wins, :integer, :default => 0
    add_column :teams, :loses, :integer, :default => 0
    add_column :teams, :ties, :integer, :default => 0
  end

  def self.down
    remove_column :teams, :goals_for
    remove_column :teams, :goals_against
    remove_column :teams, :wins
    remove_column :teams, :loses
    remove_column :teams, :ties
  end
end
