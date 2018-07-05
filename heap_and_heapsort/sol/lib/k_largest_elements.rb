require_relative 'heap'

# def k_largest_elements(array, k)
#   heap = BinaryMinHeap.new
#   array.each { |el| heap.push(el) }
#   (array.length - k).times { heap.extract }
#   heap.store
# end

def k_largest_elements(array, k)
  len = array.length
  arr = array.dup
  
  (1...len).each do |i|
    BinaryMinHeap.heapify_up(arr, i, i + 1) {|a, b| b <=> a}
  end

  (1..k).each do |i|
    arr[len - i], arr[0] = arr[0], arr[len - i]
    BinaryMinHeap.heapify_down(arr, 0, len - i) {|a, b| b <=> a }
  end

  arr.last(k)
end