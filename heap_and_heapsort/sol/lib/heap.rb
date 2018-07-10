class BinaryMinHeap
  attr_reader :store, :prc

  def initialize(&prc)
    @store = Array.new
    @prc = prc || Proc.new { |a, b| a <=> b }
  end

  def count
    @store.length
  end

  def extract
    @store[0], @store[-1] = @store[-1], @store[0]
    extracted = @store.pop
    BinaryMinHeap.heapify_down(@store, 0, count, &@prc)
    extracted
  end

  def peek
    @store[0]
  end

  def push(val)
    @store << val
    BinaryMinHeap.heapify_up(@store, count - 1, count, &@prc)
  end

  public
  def self.child_indices(len, parent_index)
    first = parent_index * 2 + 1
    [first, first + 1].select { |i| i < len }
  end

  def self.parent_index(child_index)
    raise "root has no parent" if child_index == 0
    (child_index - 1) / 2
  end

  def self.get_swap_index(array, idx1, idx2, prc)
    prc.call(array[idx1], array[idx2]) < 0 ? idx1 : idx2
  end

  def self.heapify_down(array, parent_idx, len = array.length, &prc)
    prc ||= Proc.new { |a, b| a <=> b }
    # prc ||= @prc
    heapified = false
    
    while !heapified
      heapified = true
      
      c_indices = self.child_indices(len, parent_idx)
      break if c_indices.empty?
      
      chile_idx = self.get_swap_index(array, c_indices[0], c_indices[-1], prc)
      parent_el, child_el = array[parent_idx], array[chile_idx]
      
      if prc.call(parent_el, child_el) == 1
        heapified = false
        array[parent_idx], array[chile_idx] = child_el, parent_el
        parent_idx = chile_idx
      end
    end

    array
  end


  # # Recursive
  # def self.heapify_down(array, parent_idx, len = array.length, &prc)
  #   prc ||= Proc.new { |a, b| a <=> b }

  #   parent_el = array[parent_idx]
  #   left_idx, right_idx = self.child_indices(len, parent_idx)
  #   children = []
  #   children << array[left_idx] if left_idx
  #   children << array[right_idx] if right_idx

  #   return array if children.all? { |child| prc.call(parent_el, child) < 0 }

  #   #.....
  # end

  def self.heapify_up(array, child_idx, len = array.length, &prc)
    prc ||= Proc.new { |a, b| a <=> b }
    heapified = false

    until heapified || child_idx == 0
      heapified = true
      parent_idx = self.parent_index(child_idx)
      parent, child = array[parent_idx], array[child_idx]

      if prc.call(parent, child) == 1
        heapified = false
        array[parent_idx], array[child_idx] = child, parent
        child_idx = parent_idx
      end
    end

    array
  end
end
