class TeamsController < ApplicationController
  
  layout :choose_layout
  uses_tiny_mce :options => {
                              :theme => 'advanced',
                              :theme_advanced_toolbar_location => 'top',
                              :theme_advanced_font_sizes => "10px,12px,14px,16px,24px",
                              :theme_advanced_buttons1 => "fontsizeselect,bold,italic,underline,separator,justifyleft, justifycenter,justifyright,separator,bullist,numlist,separator,outdent,indent ,separator,undo,redo,separator,link,unlink,anchor,image,cleanup,separator,table,separator,forecolor,backcolor,strikethrough,code",
                              :theme_advanced_buttons2 => '',
                              :theme_advanced_buttons3 => '',
                              :plugins => %w{ table }
                            }
  
  #before_filter :authenticate_user!, :except => [:show, :index]
  before_filter :authenticate_user!, :only => [:new, :edit]
  before_filter :authorize, :only => [:admin_roster, :edit, :update, :destroy ]
  
  def index
    if(params[:league_id])
      @league = League.find(params[:league_id])
      @teams = @league.teams
    else
      @teams = Team.all.order('name')
    end

  end

  def show
    @team = Team.find(params[:id])
    @league_schedule = @team.upcoming_league_schedule
    @team_schedule = @team.upcoming_team_schedule
  end
  
  def full_schedule
    @team = Team.find(params[:id])
    
    @league_schedule = @team.upcoming_league_schedule
    @team_schedule = @team.upcoming_team_schedule
    
    @full_schedule = @team.full_schedule
    @full_team_schedule = @team.full_team_schedule
    
    @schedule_months = @full_schedule.group_by { |s| s.scheduled_date.beginning_of_month } 
  end
  
  def roster
    @team = Team.find(params[:id])
    @league_schedule = @team.upcoming_league_schedule
    @team_schedule = @team.upcoming_team_schedule
  end
  
  def admin_roster
    @team = Team.find(params[:id])
  end

  def new
    @team = Team.new
  end

  def create
    @team = Team.new(params[:team])
    if @team.save
      redirect_to @team, :notice => "Successfully created team."
    else
      render :action => 'new'
    end
  end

  def edit
    @team = Team.find(params[:id])
  end

  def update
    @team = Team.find(params[:id])
    if @team.update_attributes(params[:team])
      redirect_to admin_index_url, :notice  => "Successfully updated team."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @team = Team.find(params[:id])
    @team.destroy
    redirect_to teams_url, :notice => "Successfully destroyed team."
  end
  
  # Used for getting teams for select dropdown
  def get_select_teams
    @teams = Team.where("league_id = ?", params[:league_id])
    
    render :partial => "teams/select_teams"
  end
  
  private
  def choose_layout
    if ['show', 'full_schedule', 'roster'].include? action_name
      'application'
    else
      'admin'
    end
  end
  
  def authorize
    # @roster = Roster.find(params[:id])
    # @team = @roster.team
    # @league = @team.league.id
    # if(@league.director_id != current_user.id)
    #   redirect_to root_url, :notice => "Authorization Failure. Invalid League Director"
    # end
    if current_user.webmaster?
    else
      @team = Team.find(params[:id])
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
