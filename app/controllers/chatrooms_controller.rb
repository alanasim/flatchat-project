class ChatroomsController < ApplicationController
  def index
  end

  def show
    @chatroom = Chatroom.find_by(id: params[:id])
    @message = Message.new
  end

  def new
    @chatroom = Chatroom.new
  end

  def create
  end
end