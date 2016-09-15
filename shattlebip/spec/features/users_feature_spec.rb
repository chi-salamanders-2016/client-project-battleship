require "rails_helper"

feature "register a user" do
  context "Valid field" do
    scenario "the user inputs valid fields into the form and an account is created" do
      # stub the computer throw
      visit '/users/new'
    end
  end
end
