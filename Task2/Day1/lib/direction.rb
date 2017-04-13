class DirectionCoeff < Struct.new(:axis, :value)
end

class Direction
  class << self
    def left
      throw NotImplementedError
    end

    def right
      throw NotImplementedError
    end

    def coeff
      throw NotImplementedError
    end
  end
end

class North < Direction
  class << self
    def left
      West
    end

    def right
      East
    end

    def coeff
      @@coeff ||= DirectionCoeff.new(:y, 1).freeze
    end
  end
end

class East < Direction
  class << self
    def left
      North
    end

    def right
      South
    end

    def coeff
      @@coeff ||= DirectionCoeff.new(:x, 1).freeze
    end
  end
end

class South < Direction
  class << self
    def left
      East
    end

    def right
      West
    end

    def coeff
      @@coeff ||= DirectionCoeff.new(:y, -1).freeze
    end
  end
end

class West < Direction
  class << self
    def left
      South
    end

    def right
      North
    end

    def coeff
      @@coeff ||= DirectionCoeff.new(:x, -1).freeze
    end
  end
end
