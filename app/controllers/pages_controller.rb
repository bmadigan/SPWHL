class PagesController < ApplicationController
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
    @pages = Page.all
  end

  def show
    @page = Page.find(params[:id])
    @assets = @page.assets
  end

  def new
    @page = Page.new
    @page.assets.build 
  end

  def create
    @page = Page.new(params[:page])
    if @page.save
      redirect_to @page, :notice => "Successfully created page."
    else
      render :action => 'new'
    end
  end

  def edit
    @page = Page.find(params[:id])
    @page.assets.build 
  end

  def update
    @page = Page.find(params[:id])
    if @page.update_attributes(params[:page])
      redirect_to @page, :notice  => "Successfully updated page."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @page = Page.find(params[:id])
    @page.destroy
    redirect_to pages_url, :notice => "Successfully destroyed page."
  end
  
  private
  def choose_layout
    if ['show'].include? action_name
      'application'
    else
      'admin'
    end
  end
end
