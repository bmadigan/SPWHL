class Tournament < ActiveRecord::Base
  attr_accessible :name, :season_id, :page_content, :director_id
end
