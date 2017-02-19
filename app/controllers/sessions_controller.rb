class SessionsController < ApplicationController
  skip_before_action :ensure_login, only: [:new, :create]

  def new
  end

  def create
  	#I did not know that the form params will be stored within the model name rather then just the params
  	user = User.find_by(username: params[:user][:username])

  	if user && user.authenticate(params[:user][:password])
  		session[:user_id] = user.id
  		redirect_to  root_url, notice: "Logged in successfully"
  	else
  		redirect_to login_url, alert: "Login Failed"
  	end
  end

  def destroy
    reset_session
    redirect_to login_url, notice: "Logged out successfully"
  end
end
