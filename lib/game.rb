class Game
  attr_reader :previous_action, :player1, :player2
  
  def initialize(player1,player2)
    @player1 = player1
    @player2 = player2
  end

  def attack(player)
    player.receive_damage
    execute_action("P2 attacked") # Change to player being attacked later
  end

  def execute_action(action)
    @previous_action = action
  end
end
