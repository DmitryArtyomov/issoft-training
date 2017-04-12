require 'set'

class Solution
  def initialize
    reset_data
  end

  # How many blocks away from start we have moved
  def path_distance(path)
    reset_data
    return 0 if path.nil? || path.empty?
    count_path_distance(path)
  end

  # How many blocks away is the block visited twice
  def twice_visited_distance(path)
    reset_data
    return nil if path.nil? || path.empty?
    count_visited_distance(path)
  end

  private

    def reset_data
      # Current coordinates (X, Y)
      @coords = [0, 0]
      # Current moving direction clockwise (0 - forward, 1 - right ...)
      @dir = 0
      # Visited blocks
      @visited = Set.new
    end

    # Move step and add every visited block. If the block is already added return false
    def move_with_logging(step)
      @dir = (@dir + (step[0] == 'R' ? 1 : -1)) % 4
      step_distance = step[1..-1].to_i
      step_distance.times do
        @coords[(@dir + 1) % 2] += (@dir < 2 ? 1 : -1)
        if @visited.include?(@coords)
          return false
        else
          @visited.add(@coords)
        end
      end
      @coords
    end

    # Move step
    def move(step)
      @dir = (@dir + (step[0] == 'R' ? 1 : -1)) % 4
      step_distance = step[1..-1].to_i
      @coords[(@dir + 1) % 2] += (@dir < 2 ? 1 : -1) * step_distance
      @coords
    end

    def dist_between_points(p1, p2)
      diff = p1.zip(p2).map { |c1, c2| c1 - c2 }
      diff.sum(&:abs)
    end

    # First visited twice block distance from start
    def count_visited_distance(path)
      path.split(', ').each do |step|
        break unless move_with_logging(step)
      end
      dist_between_points(@coords, [0, 0])
    end

    # Final block path distance from start
    def count_path_distance(path)
      path.split(', ').each do |step|
        move(step)
      end
      dist_between_points(@coords, [0, 0])
    end
end
