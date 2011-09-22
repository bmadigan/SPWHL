class HomeController < ApplicationController
  layout "application"
  
  def index
    #Latest News Article
    @article = Article.first #using first because default is desc
    # Get latest articles
    @archive = Article.lastest_articles
    
    #Todays Schedule
    #@schedule = Schedule.where("scheduled_date = ?", Date.today.to_s)
    #@schedules = Schedule.where(:scheduled_date => Date.today)
    @schedules = Schedule.todays_games
    
  end
  
  def calendar
    
  end

end
