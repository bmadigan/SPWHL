class AnnouncementsController < InheritedResources::Base
  before_filter :authenticate_user!
  
  layout 'admin'
  
  def index
    @announcements = Announcement.all
  end
  
  def show
    @announcement = Announcement.find(params[:id])
  end

  def new
    @announcement = Announcement.new
  end

  def create
    @announcement = Announcement.new(params[:announcement])
    if @announcement.save
      redirect_to admin_index_path, :notice => "Successfully created Annoucement."
    else
      render :action => 'new'
    end
  end

  def edit
    @announcement = Announcement.find(params[:id])
  end

  def update
    @announcement = Announcement.find(params[:id])
    if @announcement.update_attributes(params[:announcement])
      redirect_to admin_index_path, :notice  => "Successfully updated Annoucement."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @announcement = Announcement.find(params[:id])
    @announcement.destroy
    redirect_to admin_index_path, :notice => "Successfully destroyed Annoucement."
  end
  
end
