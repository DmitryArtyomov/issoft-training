require_relative 'move'

class Path
  FILEPATH = File.expand_path('../../input.txt', __FILE__)

  attr_reader :moves

  def initialize(filepath = FILEPATH)
    raw_moves = File.open(filepath, "r").readline.split(', ')
    @moves = raw_moves.map{ |raw_move| Move.new(raw_move) }
  end
end
