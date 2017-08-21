class ApplicationController < ActionController::Base
  #protect_from_forgery with: :exception
   before_action :authenticate_user, :only => [:post]
 # before_action :save_login_state, :only => [:login, :register,:index]

 
protected 
def authenticate_user
	
	if session[:user_id]
	     # set current user object to @current_user object variable
	  @current_user = User.find session[:user_id] 
	  return true	
	else
	  redirect_to(:controller => 'users', :action => 'login')
	  return false
	end
end

end
