class Page < ActiveRecord::Base
  acts_as_tree :order => "page_title"
  
  attr_accessible :page_title, :page_content, :assets_attributes, :page_description, :parent_id
  
  has_many :assets
  accepts_nested_attributes_for :assets, :allow_destroy => true
  
  
  
end
