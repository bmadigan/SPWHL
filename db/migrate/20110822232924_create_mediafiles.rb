class CreateMediafiles < ActiveRecord::Migration
  def self.up
    create_table :mediafiles do |t|
      t.string :name
      t.string :media_file_name
      t.string :media_content_type
      t.integer :media_file_size
      t.datetime :updated_at
      t.timestamps
    end
  end

  def self.down
    drop_table :mediafiles
  end
end
