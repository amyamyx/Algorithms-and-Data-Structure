require 'benchmark'
 
def quick_sort(arr)
  return arr if arr.length <= 1

  pivot_idx = rand(arr.length)
  pivot = arr[pivot_idx]

  # move the pivot to the beginning of the array
  arr[pivot_idx], arr[0] = arr[0], pivot

  pointer, barrier = 1, 1

  while pointer < arr.length
    curr_el = arr[pointer]

    if curr_el < pivot
      # 1) swap curr_el with the first element right to the barrier
      # 2) move barrier to right
      arr[pointer], arr[barrier] = arr[barrier], curr_el
      barrier += 1
    end

    pointer += 1
  end

  arr[0], arr[barrier - 1] = arr[barrier - 1], pivot
  left = arr.take(barrier - 1)
  right = arr.drop(barrier)

  quick_sort(left) + [pivot] + quick_sort(right)
end


# test
arr = [1,2,3,4,5]

p quick_sort(arr) == arr
p quick_sort(arr.shuffle) == arr
p quick_sort(arr.reverse) == arr