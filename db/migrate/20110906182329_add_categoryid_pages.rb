class AddCategoryidPages < ActiveRecord::Migration
  def self.up
    add_column :pages, :category_id, :integer, :default => 0
  end

  def self.down
    remove_column :pages, :category_id
  end
end
