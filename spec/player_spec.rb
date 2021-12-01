require 'player'

describe Player do
  it "should return its name" do
    player = Player.new("Kim")
    expect(player.read_name).to eq "Kim"
  end
end