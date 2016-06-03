class Chatroom < ApplicationRecord
  has_many :user_chatrooms
  has_many :users, through: :user_chatrooms
  has_many :messages, dependent: :destroy
end
