class ArticlesController < ApplicationController
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
    @articles = Article.all
  end
  
  def admin_index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
    @assets = @article.assets
    # Get latest articles
    @archive = Article.lastest_articles
  end

  def new
    @article = Article.new
    @article.assets.build 
  end

  def create
    @article = Article.new(params[:article])
    if @article.save
      redirect_to @article, :notice => "Successfully created article."
    else
      render :action => 'new'
    end
  end

  def edit
    @article = Article.find(params[:id])
    @article.assets.build 
  end

  def update
    @article = Article.find(params[:id])
    if @article.update_attributes(params[:article])
      redirect_to @article, :notice  => "Successfully updated article."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_url, :notice => "Successfully destroyed article."
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
