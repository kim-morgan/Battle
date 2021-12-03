feature "game can be lost" do

  scenario "goes to gameover page once game has been won" do
    end_game
    expect(page).to have_content("GAME OVER")
  end

  scenario "tells you who has won" do
    end_game
    expect(page).to have_content("Kim has won!")
  end

  scenario "lets you play again" do
    end_game
    click_button("Play again")
    expect(page).to have_content("Welcome to Battle!")
  end
  
end