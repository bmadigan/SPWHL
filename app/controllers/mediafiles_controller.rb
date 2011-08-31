class MediafilesController < ApplicationController
  layout 'admin'
  
  load_and_authorize_resource #cancan
  before_filter :authenticate_user!
  
  def index
    @mediafiles = Mediafile.all
  end

  def show
    @mediafile = Mediafile.find(params[:id])
  end

  def new
    @mediafile = Mediafile.new
  end

  def create
    @mediafile = Mediafile.new(params[:mediafile])
    if @mediafile.save
      redirect_to @mediafile, :notice => "Successfully created mediafile."
    else
      render :action => 'new'
    end
  end

  def edit
    @mediafile = Mediafile.find(params[:id])
  end

  def update
    @mediafile = Mediafile.find(params[:id])
    if @mediafile.update_attributes(params[:mediafile])
      redirect_to @mediafile, :notice  => "Successfully updated mediafile."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @mediafile = Mediafile.find(params[:id])
    @mediafile.destroy
    redirect_to mediafiles_url, :notice => "Successfully destroyed mediafile."
  end
end
