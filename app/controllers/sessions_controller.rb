class SessionsController < ApplicationController

  def sign_in
  end

  def create
  	@user = User.find_by(username: params[:username])
	  	if @user and @user.password == params[:password] 
	  		session[:user_id] = @user.id
	  		flash[:notice] = "You are logged in"
	  		redirect_to user_path(@user)
	  	else 
	  		flash[:alert] = "You have not logged in. Please try again"
	  		redirect_to sign_in_path
	  	end
  end


  def logout
  	session[:user_id] == nil
  	flash[:notice] = "You have successfully been logged out"
  	redirect_to root_path
  end

  def show
  end


end
