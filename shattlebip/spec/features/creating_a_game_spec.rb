require "rails_helper"

feature "creating a game" do
  scenario "the user creates a game" do
    
    visit '/games/new'
     
    page.fill_in 'Name', :with => 'New Game'

    click_button("Create Game")

    game = Game.last

    expect(page).to have_content game.name

    end
end
