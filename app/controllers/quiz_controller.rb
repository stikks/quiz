class QuizController < ApplicationController

  layout "admin"

   before_action :confirm_logged_in, :except => [:index, :show]
  def index
  end

  def show
  end

  def new
  end

  def new_c
  end

  def edit
  end

  def delete
  end


  def logout
    # mark user as logged out
    session[:user_id] = nil
    session[:username] = nil
    flash[:notice] = "Logged out"
    redirect_to(:controller => 'welcome', :action => "login")
  end 
  def login
    # mark user as logged out
    # session[:user_id] = nil
    # session[:username] = nil
    # flash[:notice] = "Logged out"
    redirect_to(:controller => 'welcome', :action => "login")
  end
end
