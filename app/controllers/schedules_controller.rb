class SchedulesController < InheritedResources::Base
  layout :choose_layout
  before_filter :authenticate_user!, :except => [:index, :show]
  
    has_scope :page, :default => 1

  def index
    @schedules = Schedule.all
  end
  
  def admin_index
    if params[:league_id]
      @schedules = Schedule.page(params[:page]).per(15).where("league_id = ?", params[:league_id])
    else
      @schedules = Schedule.page(params[:page]).per(15)
    end
    @leagues = League.all
  end

  def show
    @schedule = Schedule.find(params[:id])
  end

  def new
    @schedule = Schedule.new
    @schedule.scheduled_date = Time.now
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
    redirect_to schedules_url, :notice => "Successfully destroyed schedule."
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
