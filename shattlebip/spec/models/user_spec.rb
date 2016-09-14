require 'rails_helper'

describe "User" do
  context 'On valid user creation' do
    let(:user) {User.new(username: "Test Person", email: "Test@Test.com", password: "password1234")}

    it "is a user object" do
      expect(user.class).to eq User
    end

    it "has a username" do
      expect(user.username).to eq "Test Person"
    end

    it "has a email" do
      expect(user.email).to eq "Test@Test.com"
    end

    it "has a password_digest" do
      expect(user.password_digest.class).to eq String
    end
  end

  context 'On invalid user creation' do

    it "doesnt create a user" do
      User.create
      expect(User.count).to eq 0
    end

    it "doesnt create user if password is less than 6 characters" do
      User.create(username: "Test Person", email: "Test@Test.com", password: "pass")
      expect(User.count).to eq 0
    end
  end
end

