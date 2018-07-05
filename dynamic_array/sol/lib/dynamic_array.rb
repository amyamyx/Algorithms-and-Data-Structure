require_relative "static_array"

class DynamicArray
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
    @store[index + @start_idx]
  end

  # O(1)
  def []=(index, value)
    @store[index + @start_idx] = value
  end

  # O(1)
  def pop
    raise "index out of bounds" if @length == 0
    @length -= 1
    @store[@length]
  end

  # O(1) ammortized; O(n) worst case. Variable because of the possible
  # resize.
  def push(val)
    resize!
    @store[@length] = val
    @length += 1
  end

  # O(n): has to shift over all the elements.
  def shift
    raise "index out of bounds" if @length == 0
    @length -= 1
    @start_idx += 1
    @store[@start_idx - 1]
  end

  # O(n): has to shift over all the elements.
  def unshift(val)
    resize!
    if @start_idx > 0
      @start_idx -= 1
    elsif @start_idx == 0
      @length.downto(1) {|i| @store[i] = @store[i - 1]}
    end

    @length += 1
    @store[@start_idx] = val
  end

  protected
  attr_accessor :capacity, :store
  attr_writer :length

  def check_index(index)
  end

  # O(n): has to copy over all the elements to the new store.
  def resize!
    if @length == @capacity
      @capacity = @capacity * 2
      newStore = StaticArray.new(@capacity)
      @length.times {|i| newStore[i] = @store[i]}
      @store = newStore
    end
  end
end
