class User < ApplicationRecord
  has_many :user_chatrooms
  has_many :chatrooms, through: :user_chatrooms
  has_many :messages
end
