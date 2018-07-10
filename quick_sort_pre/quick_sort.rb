def quick_sort(arr)
  return arr if arr.length <= 1

  pivot, left, right = arr[0], [], []

  arr.each_with_index do |el, idx|
    next if idx == 0
    pivot > el ? left.push(el) : right.push(el)
  end

  quick_sort(left) + [pivot] + quick_sort(right)
end


# test
arr = [1,2,3,4,5]

p quick_sort(arr) == arr
p quick_sort(arr.shuffle) == arr
p quick_sort(arr.reverse) == arr


# [3,7,2,5,1]

# [1,2,3,5,7]

# pivot = 3
# idx = 0

# pointer = 1
# barrier = 1

# if pivot > curr_el
#   swap curr_el with the first el after barrier
# end



