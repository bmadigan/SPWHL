module ApplicationHelper
  
  def todays_date(date)
    date.strftime("%A %B %d, %Y")
  end
  
  def news_date_month(date)
    date.strftime("%b")
  end
  
  def news_date_day(date)
    date.strftime("%d")
  end
  
  def reg_short_date(date)
    date.strftime("%A %b %d")
  end
  
  def current_announcements
    @current_announcements ||= Announcement.current_accouncements
  end
  
end
