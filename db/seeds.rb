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
chat1 = Chat.create
chat2 = Chat.create
chat3 = Chat.create

alana.chats << chat1
alana.chats << chat2
jacob.chats << chat2
jacob.chats << chat3
steven.chats << chat1
steven.chats << chat3