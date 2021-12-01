require 'player'

describe Player do
  let(:player) { described_class.new("Kim")}
  
  context '#read_name'
    it "should return its name" do
      expect(player.read_name).to eq "Kim"
    end
  

  context '#read_hp'
    it "should return its HP" do
      expect(player.read_hp).to eq(Player::DEFAULT_HP)
    end
 

  context '#receive_damage' 
    it "should be able to reduce HP" do
      expect{player.receive_damage}.to change{ player.read_hp }.by(-10)
    end

end