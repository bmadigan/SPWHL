class PasswordsController < ApplicationController
  before_filter :authenticate_user!
  
  layout 'admin'

  def edit
    @user = current_user
  end

  def update
    @user = current_user
     
    if @user.update_with_password(params[:user])
      sign_in(@user, :bypass => true)
      redirect_to admin_index_path, :notice => "Password updated!"
    else
      render :edit
    end
  end
end