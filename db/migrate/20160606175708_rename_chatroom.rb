class RenameChatroom < ActiveRecord::Migration[5.0]
  def change
    rename_table :chatrooms, :chats
    rename_table :user_chatrooms, :user_chats
    rename_column :messages, :chatroom_id, :chat_id
    rename_column :user_chats, :chatroom_id, :chat_id
  end
end
