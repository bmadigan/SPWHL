class Announcement < ActiveRecord::Base
  
  def self.current_accouncements
    #where("DATE(scheduled_date) = ?", Date.today).order("TIME(scheduled_date) ASC") #sqllite
    where("DATE(start_at) <= ? AND DATE(end_at) >= ?", Date.today, Date.today)
  end
  
end
