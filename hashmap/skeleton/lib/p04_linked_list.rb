require 'byebug'
class Node
  attr_accessor :key, :val, :next, :prev, :size

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
    # optional but useful, connects previous link to next link
    # and removes self from list.
    @next.prev = @prev unless @next.nil?
    @prev.next = @next unless @prev.nil?
  end
end

class LinkedList

  attr_reader :size
  def initialize()
    @size = 0
    @head = nil
    @tail = nil
    @arr = []
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head
  end

  def last
    @tail
  end

  def empty?
    self.size == 0
  end

  def get(key)
    @arr.each_with_index do |el, i|
      return el.val if el.key == key
    end
    return nil
  end

  def include?(key)
    @arr.each do |el|
      return true if el.key == key
    end
    return false
  end

  def append(key, val)
    new_node = Node.new(key, val)
    @tail.next = new_node if size > 0
    new_node.prev = @tail
    @arr << new_node
    @head = new_node if size == 0
    @tail = new_node
    @size += 1
  end

  def update(key, val)
    @arr.each_with_index do |el, i|
      @arr[i].val = val if el.key.equal?(key)
    #  @arr.delete(i)
    end
    nil
  end

  def remove(key)

    @arr.each_with_index do |el, i|
      @arr[i].remove if el.key.equal?(key)
      el.remove if el.key.equal?(key)
    end
    @size -= 1
  end

  def each
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end
