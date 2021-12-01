require 'game'

describe Game do
  let(:game) {described_class.new(player1,player2)}
  let(:player1) { double("Kim")}
  let(:player2) { double("Chris")}
  
  context '#add_players'
  it 'should accept player1 and retrieve it' do
    expect(game.player1).to eq(player1)
  end

  it 'should accept player2 and retrieve it' do
    expect(game.player2).to eq(player2)
  end

  context '#attack' 
  it "should inform the player to receive damage" do
    expect(player1).to receive(:receive_damage)
    game.attack(player1)
  end
end