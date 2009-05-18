# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => 'd7df2c1b3e205529ee3eff89a4defb71'
  
  # See ActionController::Base for details 
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password"). 
  # filter_parameter_logging :password

  private #--------

  def admin?
    not session[:admin].blank?
  end

  def authorized
    if not admin?
      flash[:warning] = "Please login"
      redirect_to :controller => 'admins', :action => 'index'
    end
  end

end
