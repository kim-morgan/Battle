class Game
  attr_reader :player1, :player2, :turn, :current_player, :opponent
  
  def initialize(player1,player2)
    @player1 = player1
    @player2 = player2
    @players = [player1, player2]
    @current_player = @player1
    @opponent = @player2
  end

  def attack(player, damage)
    player.receive_damage(damage)
    change_turns unless over?
  end

  def change_turns
    @current_player = @players.reject{ |player| player == @current_player }[0]
    @opponent = @players.reject{ |player| player == @current_player }[0]
  end

  def over?
    @player1.read_hp == 0 || @player2.read_hp == 0
  end

  def started?
    @player1.read_hp < Player::DEFAULT_HP || @player2.read_hp < Player::DEFAULT_HP
  end

end
