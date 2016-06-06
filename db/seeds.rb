# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# USERS
alana = User.create(username: "alana", password: "password")
jacob = User.create(username: "jacob", password: "password")
steven = User.create(username: "steven", password: "password")

# CHATROOMS
chatroom1 = Chatroom.create
chatroom2 = Chatroom.create
chatroom3 = Chatroom.create

alana.chatrooms << chatroom1
alana.chatrooms << chatroom2
jacob.chatrooms << chatroom2
jacob.chatrooms << chatroom3
steven.chatrooms << chatroom1
steven.chatrooms << chatroom3