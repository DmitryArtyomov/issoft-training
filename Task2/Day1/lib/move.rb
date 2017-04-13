class Move
  TURN_DIRECTIONS = {
    'L' => :left,
    'R' => :right
  }.freeze

  attr_reader :turn, :distance

  def initialize(raw_movement)
    @turn = TURN_DIRECTIONS[raw_movement.chars.first]
    @distance = raw_movement[1..-1].to_i
  end
end
