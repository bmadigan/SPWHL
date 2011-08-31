class CreateAssets < ActiveRecord::Migration
  def self.up
    create_table :assets do |t|
      t.string :asset_file_name
      t.string :asset_content_type
      t.integer :asset_file_size
      t.integer :page_id
      t.integer :article_id

      t.timestamps
    end
  end

  def self.down
    drop_table :assets
  end
end
