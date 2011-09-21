class AddDisplayOrderLeagues < ActiveRecord::Migration
  def self.up
    add_column :leagues, :display_order, :integer, :default => 0
  end

  def self.down
    remove_column :leagues, :display_order
  end
end
