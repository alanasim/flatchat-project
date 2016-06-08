class MessageViewsController < ApplicationController
  def create
    msg_id = message_params[:message_id].slice(4..-1)
    MessageView.find_or_create_by(user_id: session[:user_id], message_id: msg_id)
  end

  private

  def message_params
    params.permit(:message_id)
  end
end