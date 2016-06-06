require 'spec_helper'

RSpec.describe "Chatroom" do
  let :user {User.create(username: "TestMan", password: "password")}
  
  describe "Chatroom index" do
    before(:each) do
      sign_in
    end
    it "lists the user's chatrooms" do
      visit "/"
      expect(page).to have_content("Chatrooms page")
    end
  end
end