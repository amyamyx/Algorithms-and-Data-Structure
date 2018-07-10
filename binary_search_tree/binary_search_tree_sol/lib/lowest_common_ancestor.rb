require_relative 'binary_search_tree'

def lowest_common_ancestor(root, node1, node2)
  # ancestor, ancestor_val = root, root.val
  # val1, val2 = node1.value, node2.value
  

end


# node1_depth = 5
# node2_depth = 3

# ancestor_arr of node2 = [node2, parent1, parent2, parent3, root]


# ancestor_arr.each do |ancestor|
#   return ancestor if ancstor.find(node1)
# end


# def lca(tree_node, node1, node2)
#   smaller = node1.value < node2.value ? node1.value : node2.value
#   bigger = node1.value > node2.value ? node1.value : node2.value

#   if tree_node.value >= smaller && tree_node.value <= bigger
#     lca = tree_node
#   elsif tree_node.value > smaller && tree_node.value > bigger
#     lca = lca(tree_node.left, node1, node2)
#   elsif tree_node.value < smaller && tree_node.value < bigger
#     lca = lca(tree_node.right, node1, node2)
#   end

#   lca
# end