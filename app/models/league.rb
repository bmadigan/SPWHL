class League < ActiveRecord::Base
  belongs_to :season
  belongs_to :director, :class_name => "User", :foreign_key => "director_id"
  
  has_many :teams
  
  attr_accessible :name, :season_id, :is_house_league, :director_id, :page_content, :short_name, :display_order
  
  default_scope :order => "display_order"
  
  validates :name, :presence => true
  
end
