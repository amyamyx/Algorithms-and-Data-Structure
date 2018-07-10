require_relative 'graph'
require 'set'
# Implementing topological sort using both Khan's and Tarjan's algorithms

# Khan's algorithm
# destroying edges
# def topological_sort(vertices)
#   queue = Queue.new
#   sorted = []

#   vertices.each do |vertex|
#     queue.push(vertex) if vertex.in_edges.empty?
#   end

#   until queue.empty?
#     current = queue.pop
#     sorted << current

#     until current.out_edges.empty?
#       edge = current.out_edges.pop
#       to_vertex = edge.to_vertex
#       edge.destroy!
#       queue.push(to_vertex) if to_vertex.in_edges.empty?
#     end
#   end

#   sorted.count < vertices.count ? [] : sorted
# end

# Khan's algorithm
# not destroying edges
# def topological_sort(vertices)
#   queue = []
#   order = []
#   in_edge_count = {}

#   vertices.each do |vertex|
#     in_edge_count[vertex] = vertex.in_edges.count
#     queue << vertex if vertex.in_edges.empty?
#   end

#   until queue.empty?
#     current = queue.shift
#     order << current
#     current.out_edges.each do |edge|
#       to_vert = edge.to_vertex
#       in_edge_count[to_vert] -= 1
#       queue << to_vert if in_edge_count[to_vert] == 0
#     end
#   end

#   order.count < vertices.count ? [] : order
# end

#Tarjan's algorithm (DFS)
def topological_sort(vertices)
  order = []
  explored = Set.new
  temp = Set.new
  cycle = false

  vertices.each do |vertex|
    cycle = dfs!(order, explored, vertex, temp, cycle) unless explored.include?(vertex)
    return [] if cycle
  end

  order
end

def dfs!(order, explored, vertex, temp, cycle)
  return true if temp.include?(vertex)
  temp.add(vertex)

  vertex.out_edges.each do |edge|
    to_vertex = edge.to_vertex
    cycle = dfs!(order, explored, to_vertex, temp, cycle) unless explored.include?(to_vertex)
    return true if cycle
  end

  explored.add(vertex)
  temp.delete(vertex)
  order.unshift(vertex)
  false
end