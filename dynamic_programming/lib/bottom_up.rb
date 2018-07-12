def blair_cache_builder(n)
  cache = { 1 => 1, 2 => 2 }
  return cache if n < 3

  (3..n).each do |i|
    cache[i] = cache[i - 1] + cache[i - 2] + i * 2 - 3
  end

  cache
end

def blair_nums(n)
  cache = blair_cache_builder(n)
  cache[n]
end

# p blair_nums(100)