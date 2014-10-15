class AccessController < ApplicationController
  layout 'admin'
  def index
  	#display text and links
  end

  def login
  	# login form
  end

  def attempt_login
  	if params[:username].present? && params[:password].present?
      found_user = User.where(:username => params[:username]).first
      if found_user
        authorized_user = found_user.authenticate( params[:password]) #User.authenticate(params[:username], params[:password])
      end
    end
    if authorized_user
      # TODO: mark user as logged in
      flash[:notice] = "You are now logged in."
      redirect_to(:action => 'index')
    else
      flash[:notice] = "Invalid username/password combination."
      redirect_to(:action => 'login')
    end
  	
  end

  def logout
   	
  end 
end