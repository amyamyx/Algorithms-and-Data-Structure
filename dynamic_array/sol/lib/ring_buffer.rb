require_relative "static_array"

class RingBuffer
  attr_reader :length

  def initialize
    @length = 0
    @capacity = 8
    @store = StaticArray.new(@capacity)
    @start_idx = 0
  end

  # O(1)
  def [](index)
    raise "index out of bounds" if index >= @length
    @store[check_index(index + @start_idx)]
  end

  # O(1)
  def []=(index, val)
    @store[check_index(index + start_idx)] = val
  end

  # O(1)
  def pop
    raise "index out of bounds" if @length == 0
    @length -= 1
    @store[check_index(@length + @start_idx)]
  end

  # O(1) ammortized
  def push(val)
    resize!
    @store[check_index(@length + @start_idx)] = val
    @length += 1
  end

  # O(1)
  def shift
    raise "index out of bounds" if @length == 0
    @length -= 1
    @start_idx = check_index(@start_idx + 1)
    @store[check_index(@start_idx - 1)]
  end

  # O(1) ammortized
  def unshift(val)
    resize!
    @start_idx = check_index(@start_idx - 1)
    @store[@start_idx] = val
    @length += 1
  end

  protected
  attr_accessor :capacity, :start_idx, :store
  attr_writer :length

  def check_index(index)
    index % @capacity
  end

  def resize!
    if @length == @capacity
      newStore = StaticArray.new(@capacity * 2)
      @start_idx -= @capacity

      @length.times do |i| 
        idx = i + @start_idx
        newStore[idx] = @store[idx]
      end

      @capacity = @capacity * 2
      @start_idx += @capacity
      @store = newStore
    end
  end 
end
