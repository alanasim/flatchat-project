class ChatsController < ApplicationController
  before_action :chat_member?, only: [:show]

  def index
  end

  def show
    @chat = Chat.find_by(id: params[:id])
    @message = Message.new
  end

  def new
    @chat = Chat.new
    @chat.users.build
  end

  def create
    @chat = Chat.create
    @chat.users << current_user
    chat_params[:users_attributes].each do |key, value|
      if value.keys.include?("username")
        @chat.users << User.find_by(username: value[:username])
      elsif value.keys.include?("phone_number")
        @chat.users << User.joins(:phone_number).where('phone_numbers.phone_number = ?',value[:phone_number])
      end
    end
    redirect_to chat_path(@chat)
  end

  def validate_username
    @id = validate_params[:id]
    if User.find_by(username: validate_params[:value])
      @validation = true
    else
      @validation = false
    end
    respond_to do |format|
      format.js
    end
  end

  def validate_phonenumber
    @id = validate_params[:id]
    if PhoneNumber.find_by(phone_number: validate_params[:value])
      @validation = true
    else
      @validation = false
    end
    respond_to do |format|
      format.js
    end
  end

  private
  def chat_params
    params.require(:chat).permit(users_attributes: [:username, :phone_number])
  end

  def validate_params
    params.permit(:value, :id)
  end

  def chat_member?
    return head(:forbidden) unless Chat.find(params[:id]).users.include?(User.find(session[:user_id]))
  end
end