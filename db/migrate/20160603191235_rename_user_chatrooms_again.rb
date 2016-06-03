class RenameUserChatroomsAgain < ActiveRecord::Migration[5.0]
  def change
    rename_table :users_chatrooms, :user_chatrooms
  end
end
