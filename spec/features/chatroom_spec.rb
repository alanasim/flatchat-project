require 'spec_helper'

RSpec.describe "Chat" do
  let(:user) {User.create(username: "TestMan", password: "password")}
  
  describe "Chat index" do
    before(:each) do
      sign_in
    end
    it "lists the user's chats" do
      visit "/"
      expect(page).to have_content("Chats page")
    end
  end
end