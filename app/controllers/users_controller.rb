class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to new_phone_number_path
      # redirect_to chatrooms_path
    else
      render :new
    end
    
  end

  def edit
  end

  def update
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end
