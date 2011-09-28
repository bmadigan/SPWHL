class RostersController < ApplicationController
  layout :choose_layout
  
  before_filter :authenticate_user!, :except => [:show, :index]
  before_filter :authorize, :only => [:admin_index, :edit, :update, :destroy ]
  
  has_scope :page, :default => 1
  
  def index
    @team = Team.find(params[:team_id])
  end
  
  def admin_index
    @rosters = Roster.page(params[:page]).per(25)
  end
  
  def show
    @roster = Roster.find(params[:id])
  end

  def new
    if current_user.manager?
      @team = Team.find_by_manager_id(current_user)
    end
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
    if current_user.webmaster?
      redirect_to rosters_admin_path, :notice => "Successfully destroyed roster."
    else
      redirect_to admin_index_path, :notice  => "Successfully destroyed roster."
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
      @roster = Roster.find(params[:id])
      @team = @roster.team
      
      if current_user.manager?
        if(@team.manager_id != current_user.id)
          redirect_to root_url, :notice => "Authorization Failure. Invalid Team Manager"
        end
      else 
        @league = @team.league
        if(@league.director_id != current_user.id)
          redirect_to root_url, :notice => "Authorization Failure. Invalid League Director"
        end
      end
      
    end
  end
  
  
end
