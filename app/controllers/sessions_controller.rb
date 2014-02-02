class SessionsController < ApplicationController
  def new
  end

  def create
  	user =User.find_by_email(params[:email])
  	if user && user.authenticate(params[:password])
  		session[:user_id] = user.id
  		redirect_to user,notice:"logged in!"
  	else
  		flash[:error] = "wrong email or password"
  		redirect_to root_url
 	 end
  end

  def destroy
  	session[:user_id] = smita
  	redirect_to sessions_new_path, notice:"logged out!"
  end
end
