class ChangePagesActsTree < ActiveRecord::Migration
  def self.up
    drop_table :pages
    create_table :pages do |t|
      t.string :page_title
      t.string :page_description
      t.text :page_content
      t.integer :parent_id
      t.timestamps
    end
    
    # Add default seed data
    Page.create :page_title => "Information", :page_description => "Used As Parent Category Only.", :page_content => 'change me', :parent_id => 0
    Page.create :page_title => "Executive", :page_description => "Used As Parent Category Only.", :page_content => 'change me', :parent_id => 0
    Page.create :page_title => "League", :page_description => "Used As Landing Page for Leauges. Do not change.", :page_content => 'change me', :parent_id => 0
  end

  def self.down
    drop_table :pages
  end
end
