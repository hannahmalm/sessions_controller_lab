class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  #this method is used within the session controller 
  #redirect this to the "new" session controller UNLESS the session is already set 
  
  #this refelcts the hello view page which destroys a session (logs you out)
  #this logic is important becuase it makes the decision to see if someone is logged in or not
  def hello 
    redirect_to controller: 'sessions', action:'new' unless session[:name]
  end 

end