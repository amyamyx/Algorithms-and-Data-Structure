require_relative 'p05_hash_map'

def can_string_be_palindrome?(str) 
  hash = HashMap.new
  str.chars.each do |ch|
    hash.include?(ch) ? hash[ch] += 1 : hash[ch] = 1
  end

  hash.select { |key, val| val.odd? }.count <= 1
end