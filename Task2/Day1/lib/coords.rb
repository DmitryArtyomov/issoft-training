class Coords < Struct.new(:x, :y)
  def initialize(x = 0, y = 0)
    self.x = x
    self.y = y
  end

  def move(axis, value)
    self.send("#{axis}=", self.send(axis).send(:+, value))
    self
  end

  def distance_to(other)
    self.zip(other).map { |c1, c2| c1 - c2}.sum(&:abs)
  end
end
