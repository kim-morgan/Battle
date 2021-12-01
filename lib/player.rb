class Player

  DEFAULT_HP = 100

  attr_reader :previous_action

  def initialize(name)
    @name = name
    @hp = DEFAULT_HP
    @previous_action = nil
  end

  def read_name
    @name
  end

  def read_hp
    @hp
  end

  def receive_damage
    @hp -= 10
  end

  def attack(player)
    player.receive_damage
    execute_action("P2 attacked")
  end

  def execute_action(action)
    @previous_action = action
  end

end