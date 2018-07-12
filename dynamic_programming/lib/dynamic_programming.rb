require 'byebug'
class DynamicProgramming

  def initialize
    @blair_cache = { 1 => 1, 2 => 2 }
    @frog_cache = { 1 => [[1]], 2 => [[1,1], [2]], 3 => [[1,1,1],[1,2],[2,1],[3]] }
    @sfh_cache = { [1,1] => [[1]] }
    # @sfh_cache = { 0 => [], 1 => [[1]]}
  end

  def blair_nums(n)
    return @blair_cache[n] if @blair_cache[n]

    entry = blair_nums(n - 1) + blair_nums(n - 2) + n * 2 - 3
    @blair_cache[n] = entry
    entry
  end

  def frog_hops_bottom_up(n)
    cache = frog_cache_builder(n)
    cache[n]
  end

  def frog_cache_builder(n)
    cache = { 1 => [[1]], 2 => [[1,1], [2]], 3 => [[1,1,1], [1,2], [2,1], [3]] }
    return cache if cache[n]

    (4..n).each do |i|
      cache[i] = []
      
      (1..3).each do |j|
        cache[i - j].each do |combo|
          cache[i] << combo + [j]
        end
      end
    end

    cache
  end

  def frog_hops_top_down(n)
    frog_hops_top_down_helper(n)
  end

  def frog_hops_top_down_helper(n)
    return @frog_cache[n] if @frog_cache[n]
    entry = []

    3.downto(1) do |i|
      prev = frog_hops_top_down_helper(n - i)
      entry +=  prev.map {|combo| combo + [i]}
    end

    @frog_cache[n] = entry
  end

  # top_down: v1.0
  def super_frog_hops(n, k)

    return super_frog_hops(n, n) if n < k
    return @sfh_cache[[n, k]] if @sfh_cache[[n, k]]

    entry = []
    (n - 1).downto(1) do |i|
      prev = super_frog_hops(n - i, k)

      if i <= k
        prev.each { |combo| entry << combo + [i] unless entry.include?(combo + [i])}
      else
        prev2 = super_frog_hops(k, k)
        prev3 = super_frog_hops(i - k, k)
        prev.each do |combo1|
          prev2.each do |combo2|
            prev3.each do |combo3|
              adding = combo1 + combo2 + combo3
              entry << adding unless entry.include?(adding)
            end
          end
        end
      end
    end

    entry << [k] if n == k
    @sfh_cache[[n, k]] = entry
    @sfh_cache[[n, k]]
  end

  #top_down: v2.0
  # def super_frog_hops(n, k)
  #   return @sfh_cache[n] if @sfh_cache[n]
  #   return super_frog_hops(n, n) if k > n
  #   entry = []

  #   entry << [k] if n == k

  #   (1..n).each do |i|
  #     prev = super_frog_hops(n - i, k)
      
  #     if i > k
  #       prev2 = super_frog_hops(n - i - k, k)
  #       prev.each do |combo|
  #         prev2.each do |combo2|
  #           entry << combo + combo2 
  #         end
  #       end
  #     else
  #       prev.each do |combo|
  #         entry << combo + [i]
  #       end
  #     end
  #   end

  #   @sfh_cache[n] = entry.uniq
  #   @sfh_cache[n]
  # end

  # bottom_up
  # def super_frog_cache_builer(n, k)
  #   cache = { 0 => [], 1 => [[1]]}
  #   return cache if cache[n]

  #   (2..n).each do |i|
  #     cache[i] = []

  #     (1..k).each do |j|
  #       if i == j
  #         cache[i] << [j]
  #         break
  #       end

  #       cache[i] += cache[i - j].map { |combo| combo + [j] }
  #     end
  #   end

  #   cache
  # end

  # def super_frog_hops(n, k)
  #   cache = super_frog_cache_builer(n, k)
  #   cache[n]
  # end

  def knapsack(weights, values, capacity)

  end

  # Helper method for bottom-up implementation
  def knapsack_table(weights, values, capacity)

  end

  def maze_solver(maze, start_pos, end_pos)
  end
end

d = DynamicProgramming.new

p d.frog_hops_bottom_up(5)
