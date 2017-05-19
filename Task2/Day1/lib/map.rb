require_relative 'path'
require_relative 'direction'
require_relative 'coords'
require_relative 'coords_history'

class Map
  attr_accessor :coords, :curr_direction
  attr_reader :path, :starting_coords, :history

  def initialize(path = Path.new)
    @path = path
    @coords = Coords.new(0, 0)
    @starting_coords = @coords.dup
    @history = CoordsHistory.new
    @curr_direction = North
  end

  def go
    path.moves.each do |move|
      apply(move)
    end
  end

  def apply(move) 
    curr_direction = curr_direction.send(move.turn)
    move.distance.times do
      coeff = curr_direction.coeff
      coords.move(coeff.axis, coeff.value)
      history.add(coords)
    end
  end

  def first_crossing
    history.first_crossing.distance_to(starting_coords)
  end

  def distance
    coords.distance_to(starting_coords)
  end
end
