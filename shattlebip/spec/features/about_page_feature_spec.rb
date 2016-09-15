require "rails_helper"

feature "about page" do
  scenario "user visits the about page" do
    visit about_path
    expect(page).to have_content "ALL About SHATTLEBIP"
  end
end
