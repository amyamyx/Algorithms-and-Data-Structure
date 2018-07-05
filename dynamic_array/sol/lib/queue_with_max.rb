# Implement a queue with #enqueue and #dequeue, as well as a #max API,
# a method which returns the maximum element still in the queue. This
# is trivial to do by spending O(n) time upon dequeuing.
# Can you do it in O(1) amortized? Maybe use an auxiliary storage structure?

# Use your RingBuffer to achieve optimal shifts! Write any additional
# methods you need.

require_relative 'ring_buffer'

class QueueWithMax
  attr_accessor :store

  def initialize
    @store = RingBuffer.new
    @max_store = RingBuffer.new
  end 

  def enqueue(val)
    update_max_store(val)
    @store.push(val)
  end

  def dequeue
    removed = @store.shift
    @max_store.shift if max == removed
    removed
  end

  def max
    @max_store[0]
  end

  def length
    @store.length
  end

  private 
  
  def ms_length
    @max_store.length
  end

  def ms_last
    @max_store[ms_length - 1]
  end
  
  def update_max_store(val)

    while ms_length > 0 && val > ms_last
      @max_store.pop
    end
    
    @max_store.push(val)
  end
end
