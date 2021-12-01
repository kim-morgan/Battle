require 'capybara/rspec'
require_relative '../../app'
Capybara.app = Battle

feature 'fill in player name' do
  before(:each) do 
    visit('/')
  end

  scenario 'home page welcomes you to battle' do 
    expect(page).to have_content 'Welcome to Battle!'
  end

  scenario 'home page has a Player 1 box' do
    expect(page.has_field?('name1')).to be_truthy
  end

  scenario 'home page has a Player 2 box' do
    expect(page.has_field?('name2')).to be_truthy
  end

  scenario 'names entered should appear on screen after submission' do
    sign_in_and_play
    expect(page).to have_content 'Kim vs Chris'
  end
end

feature "can see player 2 HP" do
  before do
    sign_in_and_play
  end

  scenario "as player 1" do
    expect(page).to have_content "Chris HP: 100"
  end
end

feature "can attack player 2" do

  scenario "as player 1 and see player 2 HP change" do
    sign_in_and_play
    click_button("Attack!")
    expect(page).to have_content "Chris HP: 90"
  end

  scenario "as player 1 and get a confirmation" do
    sign_in_and_play
    click_button("Attack!")
    expect(page).to have_content "Attack on Chris successful!"
  end


end
