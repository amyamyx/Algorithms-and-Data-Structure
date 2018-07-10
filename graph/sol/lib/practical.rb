# In this version of the problem, all packages will be listed,
# (independent packages have nil value or no entry for their 
# dependencies), but the packages ids are not numbers. 
# Do not use your note
require_relative 'graph'
require_relative 'topological_sort'

def install_order2(arr)
  dependent_pairs = arr.select {|tuple| tuple[1] }
  independent = arr.reject { |tuple| tuple[1] }.map {|tuple| tuple[0] }
  vertices = {}

  dependent_pairs.each do |tuple|
    vertices[tuple[0]] = Vertex.new(tuple[0]) unless vertices[tuple[0]]
    vertices[tuple[1]] = Vertex.new(tuple[1]) unless vertices[tuple[1]]
    Edge.new(vertices[tuple[1]], vertices[tuple[0]])
  end

  independent + topological_sort(vertices.values).map { |v| v.value 1w  3 while test
    
  end}
end