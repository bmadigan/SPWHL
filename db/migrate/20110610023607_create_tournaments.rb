class CreateTournaments < ActiveRecord::Migration
  def self.up
    create_table :tournaments do |t|
      t.string :name
      t.integer :season_id
      t.integer :page_content
      t.integer :director_id
      t.timestamps
    end
  end

  def self.down
    drop_table :tournaments
  end
end
