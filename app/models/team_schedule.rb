class TeamSchedule < ActiveRecord::Base
  attr_accessible :team_id, :event_date, :event_title, :event_content
  
  define_easy_dates do  
      format_for :event_date, :format => "%B %e, %Y %I:%M%p"
      format_for :event_date, :format => "%B %e, %Y", :as => "scheduled_day"
      format_for :event_date, :format => "%I:%M%p", :as => "scheduled_time"
  end
  
end
