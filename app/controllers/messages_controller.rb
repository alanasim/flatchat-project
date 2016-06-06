class MessagesController < ApplicationController
  def create
    message = Message.new(message_params)
    # message.user = User.find(params[:user_id])
    if message.save
      ActionCable.server.broadcast 'messages',
        message: message.content,
        user: message.user.username
      head :ok
    end
  end

  private

    def message_params
      params.require(:message).permit(:content, :chat_id, :user_id)
    end
end
