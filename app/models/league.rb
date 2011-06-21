class League < ActiveRecord::Base
  belongs_to :season
  has_many :leagues
  
  attr_accessible :name, :season_id, :is_house_league, :director_id, :page_content
  
end
