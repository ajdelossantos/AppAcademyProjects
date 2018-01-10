require 'byebug'

class DynamicProgramming

  def initialize
    @blair_cache = { 1 => 1, 2 => 2 }
    @frogs_cache = {}
  end

  def blair_nums(n)
    return nil if n <= 0
    return @blair_cache[n] unless @blair_cache[n].nil?

    odd = (2 * n) - 3
    ans = blair_nums(n - 2) + blair_nums(n - 1) + odd
    
    @blair_cache[n] = ans
    ans
  end

  def frog_hops_bottom_up(n)
    cache = frog_cache_builder(n)
    cache[n]
  end

  def frog_cache_builder(n)
    cache = [
      [],
      [[1]],
      [[1, 1], [2]],
      [[1, 1, 1], [1, 2], [2, 1], [3]]
  ]

    (4..n).each do |i|
      flattened = cache[0..i - 1].flatten(1)
      y = flattened.reject { |sub| i - sub.reduce(&:+) > 3 }
      cache[i] = y.map { |sub| sub + [i - sub.reduce(&:+)] }
    end

    cache
  end

  def frog_hops_top_down(n)

  end

  def frog_hops_top_down_helper(n)

  end

  def super_frog_hops(n, k)

  end

  def knapsack(weights, values, capacity)

  end

  # Helper method for bottom-up implementation
  def knapsack_table(weights, values, capacity)

  end

  def maze_solver(maze, start_pos, end_pos)
  end
end
