class Player

  attr_reader :previous_action

  def initialize(name)
    @name = name
    @hp = 100
    @previous_action = nil
  end

  def read_name
    @name
  end

  def read_hp
    @hp
  end

  def edit_hp(amount)
    @hp = amount
  end

  def attack(player)
    player.edit_hp(player.read_hp - 10)
    execute_action("P2 attacked")
  end

  def execute_action(action)
    @previous_action = action
  end

end