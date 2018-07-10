require_relative "heap"

class Array
  def heap_sort!
    len = length
    (0...len).each do |i| # this i is the pointer index
      BinaryMinHeap.heapify_up(self, i, i + 1) { |a, b| b <=> a }
    end
    
    (1..len).each do |i|
      self[len - i], self[0] = self[0], self[len - i]
      BinaryMinHeap.heapify_down(self, 0, len - i) { |a, b| b <=> a }
    end

    self
  end
end


# # O(nlogn)
# class Array
#   def heap_sort!
#     heap = BinaryMinHeap.new
#     len = length
#     len.times { heap.push(shift) }
#     len.times { push(heap.extract)}

#     self
#   end
# end

# class Array
#   def heap_sort!
#     arr = dup
#     len = length

#     len.times do |i|
#       curr_len = len - i
#       BinaryMinHeap.heapify_up(arr, curr_len - 1, curr_len)
#     end

#     heap = BinaryMinHeap.new(arr)
    
#     len.times do |i|
#       shift
#       push(heap.extract)
#     end

#     self
#   end 
# end