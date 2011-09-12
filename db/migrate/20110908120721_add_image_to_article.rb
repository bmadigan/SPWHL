class AddImageToArticle < ActiveRecord::Migration
  def self.up
    add_column :articles, :article_image, :string, :default => 'default.jpg'
  end

  def self.down
    remove_column :articles, :article_image
  end
end
