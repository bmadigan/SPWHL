class CreateArenas < ActiveRecord::Migration
  def self.up
    create_table :arenas do |t|
      t.string :arena_name
      t.string :short_name
      t.timestamps
    end
  end

  def self.down
    drop_table :arenas
  end
end
