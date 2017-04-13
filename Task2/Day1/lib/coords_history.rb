require_relative 'coords'

class CoordsHistory
  attr_reader :history

  def initialize(start_point = Coords.new(0, 0))
    @history = []
    @visited = {}
    add(start_point)
  end

  def add(coords)
    c = coords.dup
    @history.push(c)
    (@visited[c] ||= []) << @history.length - 1
    self
  end

  def crossings
    @visited.reject { |k, v| v.length < 2 }
  end

  def first_crossing
    crossings.min_by { |k, v| v.first }.first
  end
end
