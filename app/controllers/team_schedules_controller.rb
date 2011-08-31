class TeamSchedulesController < ApplicationController
  layout 'admin'
  
  #load_and_authorize_resource #cancan
  #before_filter :authenticate_user!, :except => [:show]
  
  def index
    @team = Team.find_by_manager_id(current_user)
    @team_schedules = TeamSchedule.find_all_by_team_id(@team)
  end

  def show
    @team = Team.find_by_manager_id(current_user)
    @team_schedule = TeamSchedule.find(params[:id])
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
end
