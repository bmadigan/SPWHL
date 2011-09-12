class ApplicationController < ActionController::Base
  protect_from_forgery
  
  # Cancan 1.5
  # rescue_from CanCan::AccessDenied do |exception|
  #     redirect_to root_url, :alert => exception.message
  #   end
  
  enable_authorization #cancan 2.0
  enable_authorization do |exception|
    redirect_to root_url, :alert => exception.message
  end
  
  def after_sign_in_path_for(resource)
      admin_index_url(resource) || welcome_path
  end
end
