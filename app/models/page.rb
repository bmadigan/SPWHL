class Page < ActiveRecord::Base
  attr_accessible :page_title, :page_content, :assets_attributes
  
  has_many :assets
  accepts_nested_attributes_for :assets, :allow_destroy => true
end
