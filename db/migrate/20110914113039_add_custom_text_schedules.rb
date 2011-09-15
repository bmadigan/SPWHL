class AddCustomTextSchedules < ActiveRecord::Migration
  def self.up
  	add_column :schedules, :custom_text, :string
  end

  def self.down
  remove_column :schedules, :custom_text
  end
end
