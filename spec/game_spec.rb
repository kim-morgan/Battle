require 'game'

describe Game do
  let(:game) {described_class.new}
  let(:player) { double("Kim")}

  context '#attack' 
  it "should inform the player to receive damage" do
    expect(player).to receive(:receive_damage)
    game.attack(player)
  end
end