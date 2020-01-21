class UsersController < ApplicationController
  def new
  	@user = User.new
  end
  def show
  	@user = User.find(params[:id])
  	# debugger
  	# opens up a console on terminal
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
  		flash[:success] = "Welcome to the Sample App!"
      	redirect_to @user
  	else
  		render 'new'
  	end
  end

  private
  	# The purpose is to not show the user all the information . More secure than @user = User.new(params[:user])
  	def user_params
  		params.require(:user).permit(:name, :email, :password, :password_confirmation)
  	end


end
