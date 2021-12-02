require 'capybara/rspec'
require_relative '../../app'
Capybara.app = Battle

feature "can see player 2 HP" do
  before do
    sign_in_and_play
  end

  scenario "as player 1" do
    expect(page).to have_content "Chris HP: 100"
  end
end

feature "can attack player 2" do

  scenario "see player 2 HP decrease by 10" do
    sign_in_and_play
    click_button("Attack!")
    expect(page).not_to have_content 'Kim HP: 100'
    expect(page).to have_content "Kim HP: 90"
  end

  scenario "as player 2 and get a confirmation" do
    sign_in_and_play
    click_button("Attack!")
    expect(page).to have_content "Attack on Kim successful!"
  end
  
end

feature "can swap turns" do
  scenario "it is player 2's turn after player 1's turn" do
    sign_in_and_play
    click_button("Attack!")
    expect(page).to have_content("Kim's turn")
  end
end
