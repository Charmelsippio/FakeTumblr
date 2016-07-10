  class UsersController < ApplicationController
  
  def index
  	@users = User.all
  end

  def sign_up #new users
  	@user = User.new
  end

  def create
	  User.create({ 
			name: params[:user][:name],  
			email: params[:user][:email],
			username: params[:user][:username],
			password: params[:user][:password] })

		redirect_to '/sign_in'
  end

  def show
  	@user = User.find(params[:id])
  end


end
