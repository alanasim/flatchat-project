class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new
  end

  def create
    user = User.find_by(username: params[:user][:username])
    if User.authenticate(params[:user][:username], params[:user][:password])
      session[:user_id] = user.id
      redirect_to chats_path
    else
      flash[:error] = "Invalid Username or Password"
      redirect_to login_path
    end
  end

  def destroy
    session.destroy
    redirect_to root_path, notice: "You have been logged out"
  end
end
