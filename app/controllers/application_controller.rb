class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def after_sign_in_path_for(resource)
      admin_index_url(resource) || welcome_path
  end
  
protected
  def log_error(exception) 
    super(exception)

    begin
      ErrorMailer.deliver_snapshot(
        exception, 
        clean_backtrace(exception), 
        @session.instance_variable_get("@data"), 
        @params, 
        @request.env)
    rescue => e
      logger.error(e)
    end
  end
end
