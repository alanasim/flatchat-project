class ChatroomsController < ApplicationController
  def index
  end

  def show
    @chatroom = Chatroom.find_by(id: params[:id])
    @message = Message.new
  end
end