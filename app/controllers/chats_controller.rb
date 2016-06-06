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
        @chat.users << User.find_by(phone_number: value[:phone_number])
      end
    end
    redirect_to chat_path(@chat)
  end

  private
  def chat_params
    params.require(:chat).permit(users_attributes: [:username, :phone_number])
  end

  def chat_member?
    return head(:forbidden) unless Chat.find(params[:id]).users.include?(User.find(session[:user_id]))
  end
end