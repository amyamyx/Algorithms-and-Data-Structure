require 'byebug'
class QuickSort
  # Quick sort has average case time complexity O(nlogn), but worst
  # case O(n**2).

  # Not in-place. Uses O(n) memory.
  # def self.sort1(arr)
  #   return arr if arr.length <= 1

  #   pivot, left, right = arr[0], [], []

  #   arr.each_with_index do |el, idx|
  #     next if idx == 0
  #     pivot > el ? left.push(el) : right.push(el)
  #   end

  #   sort1(left) + [pivot] + sort1(right)
  # end

  def self.sort1(arr)
    return arr if arr.length < 2
    pivot_idx = rand(arr.length)
    pivot, left, right = arr[pivot_idx], [], []

    arr.each_with_index do |el, idx|
      next if idx == pivot_idx
      el < pivot ? left.push(el) : right.push(el)
    end

    sort1(left) + [pivot] + sort2(right)
  end

  def self.swap(array, a, b)
    array[a], array[b] = array[b], array[b]
  end

  # In-place.
  # def self.sort2!(array, start = 0, length = array.length, &prc)
  #   prc ||= Proc.new { |a, b| a <=> b }
  #   return array if length <= 1

  #   len =  length + start
  #   rand_idx = rand(len - start).to_i + start
  #   pivot = array[rand_idx]

  #   pivot_idx = QuickSort.partition(array, rand_idx, length , &prc)


  #   left_length = pivot_idx - start
  #   right_length = length - pivot_idx - 1

  #   sort2!(array, start, left_length, &prc)
  #   sort2!(array, pivot_idx + 1, right_length, &prc)

  #   array
  # end

  def self.sort2!(array, start = 0, length = array.length, &prc)
    prc ||= Proc.new { |a, b| a <=> b }
    return array if length < 2

    pivot_idx = partition(array, start, length, &prc)

    left_length = pivot_idx - start
    right_length = length - left_length - 1

    sort2!(array, start, left_length, &prc)
    sort2!(array, pivot_idx + 1, right_length, &prc)

    array
  end

  # def self.partition(array, start, length, &prc)
  #   # pivot_idx = rand(length) + start
  #   prc ||= Proc.new { |a, b| a <=> b }
  #   pivot_idx = start
  #   pivot = array[start]

  #   (start + 1...length + start).each do |curr_idx|
  #     curr_el = array[curr_idx]
  #     if prc.call(curr_el, pivot) < 0
  #       swap(array, pivot_idx, curr_idx)
  #       pivot_idx += 1
  #     end
  #   end

  #   swap(array, start, pivot_idx)

  #   pivot_idx
  # end
  

  def self.partition(array, start, length, &prc)
    prc ||= Proc.new { |a, b| a <=> b }
    
    pivot = array[start]
    barrier = start + 1
    len = length + start

    length.times do |i|
      break if start + i == array.length
      curr_el = array[start + i]

      if prc.call(pivot, curr_el) > 0
        array[start + i], array[barrier] = array[barrier], curr_el
        barrier += 1
      end
    end

    pivot_idx = barrier - 1
    array[start], array[pivot_idx] = array[pivot_idx], pivot
    pivot_idx
  end
end


# p QuickSort.sort2!([5,6,7,2,8,1,4,3])
# p QuickSort.partition([4,3,5,2,1,6], 0, 6)
p QuickSort.sort1([5,6,7,8,2,3,4,1])

class Array
  def find_k_smallest(k)
    pivot = first
    pivot_idx = 0
    start = 0
    k.times do
      QuickSort.partition(self, start, length)
      if array[pivot_idx] == array[start]

      end
    end

    take(k)
  end
end


arr = [1,2,3,4,5,6,7]

p arr.shuffle.find_k_smallest(3)