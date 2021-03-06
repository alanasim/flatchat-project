class User < ApplicationRecord
  has_many :user_chats
  has_many :chats, through: :user_chats
  has_many :messages
  has_one :phone_number
  has_many :message_views

  has_secure_password

  def self.authenticate(username, password)
    user = User.find_by(username: username)
    !!user && !!user.authenticate(password)
  end
end
