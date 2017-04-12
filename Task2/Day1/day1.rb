require_relative 'lib/solution'

solution = Solution.new

File.foreach('task.txt').with_index do |task, line_num|
  path_dist = solution.path_distance(task)
  twice_dist = solution.twice_visited_distance(task)
  puts "Task #{line_num + 1}: Distance from start is #{path_dist} blocks\n\
    \tDistance from first twice-visited block to start is #{twice_dist} blocks"
end
