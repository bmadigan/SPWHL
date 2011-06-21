class CreateRosters < ActiveRecord::Migration
  def self.up
    create_table :rosters do |t|
      t.integer :team_id
      t.string :first_name
      t.string :last_name
      t.string :position
      t.string :jersey_number
      t.timestamps
    end
  end

  def self.down
    drop_table :rosters
  end
end
