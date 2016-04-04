class SessionsController < ApplicationController
  # Creates a new session 
  def new
  end
  # Allows a user to log in to the system i.e. create a user session 
  def create
  	user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_url, notice: 'Logged in!'
    else
      render :new
    end
  end
  # Allows a user to sign out of the system, ending a user session
  def destroy
  	session[:user_id] = nil
    redirect_to root_url, notice: 'Logged out!'
  end
  end
