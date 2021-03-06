require 'spec_helper'

RSpec.describe "Chat" do
  let(:alana) {User.create(username: "alana", password: "password")}
  let(:jacob) {User.create(username: "steven", password: "password")}
  let(:steven) {User.create(username: "steven", password: "password")}
  let(:chat1) {Chat.create}
  let(:chat2) {Chat.create}
  
  
  describe "Chat index" do
    before(:each) do
      sign_in(alana)
    end

    before(:each) {
      alana.chats << chat1
      steven.chats << chat1
    }

    before(:each) {
        jacob.chats << chat2
        steven.chats << chat2
      }

    it "lists the user's chats" do
      visit "/"
      expect(page).to have_content("steven")
    end

    it "does not list chats that the user is not a part of" do
      visit "/"
      expect(page).not_to have_content("jacob")
    end

  end

  describe "Chat new" do
    before(:each) do
      sign_in(alana)
    end

    it "allows a user to create a new chat by typing a valid username" do
      visit "/chats/new"
      select 'Username', from: 'select-0'
      fill_in('chat_users_attributes_0_username', :with => 'jacob')
      click_on('Initiate Chat')
      expect(alana.chats && jacob.chats).to include(Chat.last)
    end

  end

end