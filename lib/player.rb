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

  def attacked
    @hp -= 10
    execute_action("P2 attacked")
  end

  def execute_action(action)
    @previous_action = action
  end

end