class UsersController < ApplicationController
  layout "admin"

  before_action :confirm_logged_in, :except => [:new, :create]
  
  def index
    @users = User.sorted
  end

  def show
    @users = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    # Instantiate a new object using form parameters
    @user = User.new(user_params)
    #@user.password_digest = BCrypt::Password.create(params[:password]).to_s
    # Save the object
    if @user.save
      # If save succeeds, redirect to the index action
      flash[:notice] = "User created successfully"
      redirect_to(:action => 'index')
    else
      # If save fails, redisplay the form so user can fix problems
      render('new')
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    # Find an existing object using form parameters
    @user = User.find(params[:id])
    # Update the object
    if @user.update_attributes(user_params)
      #@user.password_digest = BCrypt::Password.create(params[:password]).to_s
      # If update succeeds, redirect to the index action
      flash[:notice] = "User '#{User.name}' updated successfully"
      redirect_to(:action => 'show', :id => @user.id)
    else
      # If update fails, redisplay the form so user can fix problems
      render('edit')
    end
  end


  def delete
    @user = User.find(params[:id])
  end
  
  def destroy
    user = User.find(params[:id]).destroy
    flash[:notice] = "User '#{User.name}' destroyed successfully."
    redirect_to(:action => 'index')
  end

  def user_params
    params.require(:user).permit(:name, :password, :email, :id, :username)
  end

  def logout
    # mark user as logged out
    session[:user_id] = nil
    session[:username] = nil
    flash[:notice] = "Logged out"
    redirect_to(:controller => 'welcome', :action => "login")
  end 

end
