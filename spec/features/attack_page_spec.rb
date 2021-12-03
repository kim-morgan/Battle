feature "can see HP" do
  before do
    sign_in_and_play
  end

  scenario "can see player 2's HP" do
    expect(page).to have_content "Chris HP: 100"
  end

  scenario "can see own HP" do
    expect(page).to have_content "Kim HP: 100"
  end
end

feature "can attack player 2" do

  scenario "see player 2 HP decrease by 10" do
    sign_in_and_play
    click_button("Attack!")
    click_button("Attack!")
    expect(page).not_to have_content 'Chris HP: 100'
    expect(page).to have_content "Chris HP: 90"
  end

  scenario "as player 2 and get a confirmation" do
    sign_in_and_play
    click_button("Attack!")
    expect(page).to have_content "Kim attacked Chris!"
  end
  
end

feature "can swap turns" do
  scenario "it is player 2's turn after player 1's turn" do
    sign_in_and_play
    select "Punch", from: 'attack'
    click_button("Attack!")
    expect(page).to have_content("Chris's turn")
  end
end

feature "can select an attack" do
  scenario "it punches opponent and reduces HP by 10" do
    sign_in_and_play
    select "Punch", from: 'attack'
    click_button("Attack!")
    expect(page).to have_content("Chris HP: 90")
  end

  scenario "it stabs opponent and reduces HP by 20" do
    sign_in_and_play
    select "Stab", from: 'attack'
    click_button("Attack!")
    expect(page).to have_content("Chris HP: 80")
  end

  scenario "it sets flamethrower on opponent and reduces HP by 25" do
    sign_in_and_play
    select "Flamethrower", from: 'attack'
    click_button("Attack!")
    expect(page).to have_content("Chris HP: 75")
  end

  scenario "it slaps opponent and reduces HP by 5" do
    sign_in_and_play
    select "Slap", from: 'attack'
    click_button("Attack!")
    expect(page).to have_content("Chris HP: 95")
  end

end
