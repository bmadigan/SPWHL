class TeamSchedule < ActiveRecord::Base
  attr_accessible :team_id, :event_date, :event_title, :event_content
end
