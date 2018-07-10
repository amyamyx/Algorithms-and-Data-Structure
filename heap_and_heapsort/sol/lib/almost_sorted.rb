require_relative 'heap'

def almost_sorted(arr, k)
  heap = BinaryMinHeap.new
  (k + 1).times do
    heap.push(arr.shift)
  end

  while heap.count > 0
    print heap.extract
    heap.push(arr.shift) if arr[0]
  end
end

# require_relative 'heap'

# def almost_sorted(arr, k)
#   heap = BinaryMinHeap.new
#   # If k = 2, the first output element must be
#   # within the first 3 numbers, so we build a heap of 3
#   (k + 1).times do
#     heap.push(arr.shift)
#   end

#   # Accounts for when the array runs out but we still have
#   # numbers in our heap
#   while heap.count > 0
#     print heap.extract
#     heap.push(arr.shift) if arr[0]
#   end
# end