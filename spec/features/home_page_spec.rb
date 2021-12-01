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
    fill_in('name1', with: 'Kim')
    fill_in('name2', with: 'Chris')
    click_button('Submit')
    expect(page).to have_content 'Kim vs Chris'
  end
end

