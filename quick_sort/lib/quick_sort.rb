class QuickSort
  def self.sort1(arr)
    
  end

  def self.sort2!(arr, start = 0, length = arr.length, &prc)
    prc ||= Proc.new { |a, b| a <=> b}
    return arr if length < 2

    pivot = arr[start]

    pivot_idx = partition(arr, start, length, &prc)
    
    left_length = pivot_idx - start
    right_length = length - left_length - 1

    sort2!(arr, start, left_length, &prc)
    sort2!(arr, pivot_idx + 1, right_length, &prc)

    arr
  end

  def self.swap!(arr, idx1, idx2)
    arr[idx1], arr[idx2] = arr[idx2], arr[idx1]
  end

  def self.partition(arr, start, length, &prc)
    prc ||= Proc.new { |a, b| a <=> b}

    pivot = arr[start]
    part_idx = start + 1

    (start + 1...start + length).each do |curr_idx|
      curr_el = arr[curr_idx]
      
      if prc.call(pivot, curr_el) > 0
        swap!(arr, part_idx, curr_idx)
        part_idx += 1
      end
    end
    
    swap!(arr, part_idx - 1, start)
    
    part_idx - 1
  end
end

class Array
  def find_k_smallest(k)
    pivot = first
    pivot_idx = 0
    start = 0
    k.times do
      QuickSort.partition(self, start, length)
    end

    take(k)
  end
end