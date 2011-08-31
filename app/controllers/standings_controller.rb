class StandingsController < ApplicationController
  layout :choose_layout
  
  def index
    @standings = Standings.all
  end

  def show
    @standings = Standings.find(params[:id])
  end

  def new
    @standings = Standings.new
  end

  def create
    @standings = Standings.new(params[:standings])
    if @standings.save
      redirect_to @standings, :notice => "Successfully created standings."
    else
      render :action => 'new'
    end
  end

  def edit
    @standings = Standings.find(params[:id])
  end

  def update
    @standings = Standings.find(params[:id])
    if @standings.update_attributes(params[:standings])
      redirect_to @standings, :notice  => "Successfully updated standings."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @standings = Standings.find(params[:id])
    @standings.destroy
    redirect_to standings_url, :notice => "Successfully destroyed standings."
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
