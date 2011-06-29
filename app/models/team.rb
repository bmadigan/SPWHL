class Team < ActiveRecord::Base
  belongs_to :league
  has_many :rosters
  belongs_to :manager, :class_name => "User", :foreign_key => "manager_id"
  
  attr_accessible :name, :league_id, :manager_id, :team_page_content
  
end
