class League < ActiveRecord::Base
  belongs_to :season
  has_many :teams
  
  attr_accessible :name, :season_id, :is_house_league, :director_id, :page_content, :short_name
  
  validates :name, :presence => true
  
end
