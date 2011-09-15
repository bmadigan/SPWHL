class LeaguesController < ApplicationController
  
  before_filter :authenticate_user!, :except => [:show, :index, :standings, :rosters]
  before_filter :authorize, :only => [:admin_index, :admin_standings, :edit, :update, :destroy ]
  
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
                              
  def index
    @leagues = League.all
    # In this index, we are going to use it in the public area.
    # For a list of admin league listings, see the admin_index below
    @page = Page.find(3) #3 is the pkid for the league. Its the pages table.
  end
  
  def admin_index
    @leagues = League.all
  end

  def admin_standings
    @league = League.find(params[:id])
    @schedules = Schedule.not_in_standings(@league)
  end
  
  def standings
    @league = League.find(params[:id])
    @teams = @league.teams
    @steams = Team.select_by_standings(@league.id)
  end
  
  def rosters
    @league = League.find(params[:id])
    @teams = @league.teams
  end
  
  def show
    @league = League.find(params[:id])
    # Get the team listings for this leage.
    @teams = @league.teams
  end

  def new
    @league = League.new
  end

  def create
    @league = League.new(params[:league])
    if @league.save
      redirect_to @league, :notice => "Successfully created league."
    else
      render :action => 'new'
    end
  end

  def edit
    @league = League.find(params[:id])
  end

  def update
    @league = League.find(params[:id])
    if @league.update_attributes(params[:league])
      redirect_to admin_index_path, :notice  => "Successfully updated league."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @league = League.find(params[:id])
    @league.destroy
    redirect_to leagues_url, :notice => "Successfully destroyed league."
  end

  
  private
  def choose_layout
    if ['show', 'index', 'standings', 'rosters'].include? action_name
      'application'
    else
      'admin'
    end
  end
  
  def authorize
    if current_user.webmaster?      
    else
      @league = League.find(params[:id])
      if(@league.director_id != current_user.id)
        redirect_to root_url, :notice => "Authorization Failure. Invalid League Director"
      end
    end
  end
  
end
