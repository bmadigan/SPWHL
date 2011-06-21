class AddContentConvenyorToLeague < ActiveRecord::Migration
  def self.up
    add_column :leagues, :director_id, :integer
    add_column :leagues, :page_content, :text
  end

  def self.down
    remove_column :leagues, :director_id
    remove_column :leagues, :page_content
  end
end
