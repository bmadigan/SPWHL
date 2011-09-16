class SchedulesController < ApplicationController
  layout :choose_layout
  
  before_filter :authenticate_user!, :except => [:index, :show]
  before_filter :authorize, :only => [:admin_index, :director_index, :update_standings, :save_standings, :edit, :update, :destroy ]

  has_scope :page, :default => 1

  def index
    @leagues = League.all
  end
  
  def admin_index
    if params[:league_id]
      @schedules = Schedule.page(params[:page]).per(15).where("league_id = ?", params[:league_id])
    else
      @schedules = Schedule.page(params[:page]).per(15)
    end
    @leagues = League.all
  end
  
  def director_index
    @schedules = Schedule.page(params[:page]).per(15).where("league_id = ?", params[:id])
  end

  def show
    # Show by league id
    @league = League.find(params[:id])
    @leagues = League.all
    #@schedules = Schedule.where("league_id = ?", params[:id]) #shows all
    @schedules = Schedule.where("league_id = ? AND scheduled_date >= ?", params[:id], Date.today)
    
    @schedule_days = @schedules.group_by { |s| s.scheduled_date.beginning_of_day } 
  end

  def new
    @schedule = Schedule.new
    @schedule.scheduled_date = Time.now
    if current_user.director?
      @teams = Team.find_all_by_league_id(current_user.league.id)
    end
  end
  
  def league
    #Select which league
    @leagues = League.all
  end

  def create
    @schedule = Schedule.new(params[:schedule])
    if @schedule.save
      redirect_to new_schedule_path, :notice => "Successfully created schedule."
    else
      render :action => 'new', :notice => "Failed! created schedule."
    end
  end

  def edit
    @schedule = Schedule.find(params[:id])
    if current_user.director?
      @teams = Team.find_all_by_league_id(current_user.league.id)
    end
  end

  def update
    @schedule = Schedule.find(params[:id])
    if @schedule.update_attributes(params[:schedule])
      redirect_to schedule_admin_path, :notice  => "Successfully updated schedule."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @schedule = Schedule.find(params[:id])
    @schedule.destroy
    redirect_to schedule_admin_path, :notice => "Successfully destroyed schedule."
  end
  
  def update_standings
    @schedule = Schedule.find(params[:id])
  end
  
  def save_standings
    @schedule = Schedule.find(params[:id])
    @schedule.set_standings = true
    
    # Team Logic
    # ---------------------------
    # Update Home Team
    @ht = Team.find(@schedule.home_team_id)
    @at = Team.find(@schedule.away_team_id)
    
    if @schedule.update_attributes(params[:schedule])
      
      @ht.update_team_standings(@schedule.home_team_score, @schedule.away_team_score)
      @at.update_team_standings(@schedule.away_team_score, @schedule.home_team_score)
      
      redirect_to admin_league_standings_path(@schedule.league_id), :notice  => "Successfully added standings"
    else
      render :action => 'update_standings', :notice => "There was a problem saving the standings. Please try again."
    end
  end
  
  private
  def choose_layout
    if ['show', 'index'].include? action_name
      'application'
    else
      'admin'
    end
  end
  
  def authorize
    if current_user.webmaster?
    else
      
      if action_name == 'director_index'
        @league = League.find(params[:id])
        if(@league.director_id != current_user.id)
          redirect_to root_url, :notice => "Authorization Failure. Invalid League Director"
        end
      end
      
      if action_name == 'edit'
        @schedule = Schedule.find(params[:id])
        @league = @schedule.league
        if(@league.director_id != current_user.id)
          redirect_to root_url, :notice => "Authorization Failure. Invalid League Director"
        end
      end

    end
  end
  

end
