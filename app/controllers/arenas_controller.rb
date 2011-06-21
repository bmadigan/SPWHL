class ArenasController < ApplicationController
  def index
    @arenas = Arena.all
  end

  def show
    @arena = Arena.find(params[:id])
  end

  def new
    @arena = Arena.new
  end

  def create
    @arena = Arena.new(params[:arena])
    if @arena.save
      redirect_to @arena, :notice => "Successfully created arena."
    else
      render :action => 'new'
    end
  end

  def edit
    @arena = Arena.find(params[:id])
  end

  def update
    @arena = Arena.find(params[:id])
    if @arena.update_attributes(params[:arena])
      redirect_to @arena, :notice  => "Successfully updated arena."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @arena = Arena.find(params[:id])
    @arena.destroy
    redirect_to arenas_url, :notice => "Successfully destroyed arena."
  end
end
