class RostersController < ApplicationController
  layout :choose_layout
  
  load_and_authorize_resource #cancan
  before_filter :authenticate_user!, :except => [:show, :index]
  
  def index
    @team = Team.find(params[:team_id])
  end
  
  def show
    @roster = Roster.find(params[:id])
  end

  def new
    @roster = Roster.new
  end

  def create
    @roster = Roster.new(params[:roster])
    if @roster.save
      redirect_to new_roster_path, :notice => "Successfully created roster."
    else
      render :action => 'new'
    end
  end

  def edit
    @roster = Roster.find(params[:id])
  end

  def update
    @roster = Roster.find(params[:id])
    if @roster.update_attributes(params[:roster])
      redirect_to admin_index_path, :notice  => "Successfully updated roster."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @roster = Roster.find(params[:id])
    @roster.destroy
    redirect_to rosters_url, :notice => "Successfully destroyed roster."
  end
  
  private
  def choose_layout
    if ['show', 'index'].include? action_name
      'application'
    else
      'admin'
    end
  end
  
end
