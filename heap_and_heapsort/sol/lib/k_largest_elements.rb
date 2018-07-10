require_relative 'heap'

def k_largest_elements(array, k)
  heap = BinaryMinHeap.new
  # array.each { |el| heap.push(el) }
  k.times { heap.push(array.pop) }
  # (array.length - k).times { heap.extract }
  until array.empty?
    heap.push(array.pop)
    heap.extract
  end
  heap.store
end

# space: O(1), time: O(nlog n)
# def k_largest_elements(array, k)
#   len = array.length
#   arr = array.dup
  
#   (1...len).each do |i|
#     BinaryMinHeap.heapify_up(arr, i, i + 1) {|a, b| b <=> a}
#   end

#   (1..k).each do |i|
#     arr[len - i], arr[0] = arr[0], arr[len - i]
#     BinaryMinHeap.heapify_down(arr, 0, len - i) {|a, b| b <=> a }
#   end

#   arr.last(k)
# end