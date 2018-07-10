# Given an Array of tuples, where tuple[0] represents a package id,
# and tuple[1] represents its dependency, determine the order in which
# the packages should be installed. Only packages that have dependencies
# will be listed, but all packages from 1..max_id exist.

# N.B. this is how `npm` works.

# Import any files you need to

require_relative 'graph'
require_relative 'topological_sort'
# def install_order(arr)
#   all_pkg = (1..arr.flatten.max).to_a
#   vertices = all_pkg.map { |pkg| Vertex.new(pkg) }


#   arr.each do |pair|
#     to_vertex = vertices.select { |vertex| vertex.value == pair[0] }.first
#     from_vertex = vertices.select { |vertex| vertex.value == pair[1] }.first
#     Edge.new(from_vertex, to_vertex)
#   end

  
#   result = []
#   while result.length < vertices.length
#     vertices.select { |vertex| vertex.in_edges.empty? }.each do |vertex|
#       result << vertex.value unless result.include?(vertex.value)
#       vertex.out_edges.each { |edge| edge.destroy! }
#     end
#   end

#   result
# end

def install_order(arr)
  max = 0
  independent = []
  vertices = {}

  arr.each do |tuple|
    vertices[tuple[0]] = Vertex.new(tuple[0]) unless vertices[tuple[0]]
    vertices[tuple[1]] = Vertex.new(tuple[1]) unless vertices[tuple[1]]
    Edge.new(vertices[tuple[1]], vertices[tuple[0]])

    max = tuple.max if tuple.max > max
  end

  (1..max).each do |i|
    independent << i unless vertices[i]
  end

  independent + topological_sort(vertices.values).map {|v| v.value}
end