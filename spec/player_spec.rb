require 'player'

describe Player do
  it "should return its name" do
    player = Player.new("Kim")
    expect(player.read_name).to eq "Kim"
  end

  it "should be able to reduce HP" do
    player = Player.new("Kim")
    player.attacked
    expect(player.read_hp).to eq 90
  end
end