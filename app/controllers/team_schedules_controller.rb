class TeamSchedulesController < ApplicationController
  layout :choose_layout
  
  #load_and_authorize_resource #cancan
  #before_filter :authenticate_user!, :except => [:show]
  
  def index
    @team = Team.find_by_manager_id(current_user)
    @team_schedules = TeamSchedule.find_all_by_team_id(@team)
  end

  def show
    @ts = TeamSchedule.find(params[:id])
    
    @team = Team.find(@ts.team_id)
    @league_schedule = @team.upcoming_league_schedule
    @team_schedule = @team.upcoming_team_schedule
  end

  def new
    @team = Team.find_by_manager_id(current_user)
    @team_id = @team.id
    @team_schedule = TeamSchedule.new
  end

  def create
    @team = Team.find_by_manager_id(current_user)
    @team_schedule = TeamSchedule.new(params[:team_schedule])
    
    @team_schedule.team_id = @team.id
    if @team_schedule.save
      redirect_to @team_schedule, :notice => "Successfully created team schedule."
    else
      render :action => 'new'
    end
  end

  def edit
    @team = Team.find_by_manager_id(current_user)
    @team_schedule = TeamSchedule.find(params[:id])
  end

  def update
    @team_schedule = TeamSchedule.find(params[:id])
    if @team_schedule.update_attributes(params[:team_schedule])
      redirect_to admin_index_url, :notice  => "Successfully updated your team schedule."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @team_schedule = TeamSchedule.find(params[:id])
    @team_schedule.destroy
    redirect_to team_schedules_url, :notice => "Successfully destroyed team schedule."
  end
  
  private
  def choose_layout
    if ['show'].include? action_name
      'application'
    else
      'admin'
    end
  end
  
end
