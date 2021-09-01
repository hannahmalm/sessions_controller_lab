class SessionsController < ApplicationController

  #get “/login”, to: “sessions#new”
  #the user gets the login
  def new
  end
 
  #post “/login”, to: “sessions#create”
  #the user enters username
  #user submits form using POST
  #In the create action of the SessionsController we set a cookie on the user's browser by writing their username into the session hash.
  #Redirects to the login page if :name is nil or empty
  #sets session[:name] if name was given
  def create 
    #if the name is nil or empty, redirect to new login page
    if !params[:name] || params[:name].empty?
      return redirect_to(controller: 'sessions', action: 'new') 
    else 
    #if session name is given and matches params, redirect to the / page
    #the hello action verifys if someone is logged in and prints out the hello view
      session[:name] = params[:name]
      redirect_to controller: 'application', action: 'hello'
    end 
  end 


  #route this action as post '/logout'
  #clears session[:name] nil if it was not set
  #clears session[:name] if it was set
  #This redirects to the "hello" method in the application, which determines if this is a new session or not 
  def destroy 
    session.delete :name 
    redirect_to controller: 'application', action: 'hello'
  end 
end
