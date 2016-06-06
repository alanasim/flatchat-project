class ChatsController < ApplicationController
  def index
  end

  def show
    @chat = Chat.find_by(id: params[:id])
    @message = Message.new
  end
end