require "capybara/rspec"
require_relative "../../app"
Capybara.app = Battle
# feature "serve web app" do
#   scenario "should serve home page" do
#     visit("/")
#     expect(page).to have_content 'Testing infrastructure working!'
#   end
# end
feature "fill in player name" do
  scenario "names should be on screen" do
    visit("/")
    fill_in('name1', with: 'Kim')
    fill_in('name2', with: 'Chris')
    click_button('Submit')
    expect(page).to have_content 'Kim, Chris'
  end
end