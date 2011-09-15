class UsersController < ApplicationController
  layout 'admin'
 
  before_filter :authenticate_user!
  
  def index
    @users = User.all
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to admin_index_path, :notice => "Successfully created User Account."
    else
      render :action => 'new'
    end  
  end
  
  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      redirect_to admin_index_path, :notice  => "Successfully updated User Account."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_url, :notice => "Successfully destroyed User Account"
  end

end
