class Player

  DEFAULT_HP = 100

  def initialize(name)
    @name = name
    @hp = DEFAULT_HP
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

end