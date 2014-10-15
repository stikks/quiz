class UsersController < ApplicationController
  layout false

  def index
    @users = User.sorted
  end

  def show
    @users = User.find(params[:id])
  end

  def new
    @user = User.new(:name => "Default")
  end

  def create
    # Instantiate a new object using form parameters
    @user = User.new(user_params)
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
    if @user.update_attributes(subject_params)
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
    params.require(:user).permit(:name, :password, :email, :id)
  end
end
