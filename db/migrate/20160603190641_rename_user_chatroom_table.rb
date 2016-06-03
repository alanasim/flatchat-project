class RenameUserChatroomTable < ActiveRecord::Migration[5.0]
  def change
    rename_table :user_chatrooms, :users_chatrooms
  end
end
