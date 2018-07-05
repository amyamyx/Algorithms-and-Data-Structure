class Node
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous node to next node
    # and removes self from list.
    @next.prev = @prev
    @prev.next = @next
    @next, @prev = nil, nil
  end
end

class LinkedList
  
  include Enumerable
  
  def initialize
    @head = Node.new
    @tail = Node.new
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |node, j| return node if i == j }
    nil
  end

  def first
    # return nil if empty?
    @head.next
  end

  def last
    # return nil if empty?
    @tail.prev
  end

  def empty?
    !self[0]
  end

  def get(key)
    get_node(key).val if include?(key)
  end

  def get_node(key)
    each { |node| return node if node.key == key }
  end

  def include?(key)
    each { |node| return true if node.key == key }
    false
  end

  def append(key, val)
    node = Node.new(key, val)
    last_node = last
    @tail.prev = node
    last_node.next = node
    node.prev = last_node
    node.next = @tail
  end

  def update(key, val)
    get_node(key).val = val if include?(key)
  end

  def remove(key)
    get_node(key).remove if include?(key)
  end

  def each
    current_node = @head.next
    until current_node == @tail
      yield(current_node)
      current_node = current_node.next
    end
  end

  # uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, node| acc << "[#{node.key}, #{node.val}]" }.join(", ")
  end
end
