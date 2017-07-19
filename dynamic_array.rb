require_relative "static_array"
require 'byebug'

class DynamicArray

  attr_reader :length

  def initialize
    self.store, self.capacity, self.length = StaticArray.new(8), 8, 0
  end

  def [](index)
    if length <= index || index < 0
      raise "index out of bounds"
    end
    store[index]
  end

  def []=(index, value)
    if length <= index || index < 0
      raise "index out of bounds"
    end
    self.store[index] = value
  end

  def push(el)
    resize! if length == capacity
    self.length += 1
    self[length - 1] = el
    nil
  end

  def pop
    raise "index out of bounds" unless (length > 0)
    popped = self[length - 1]
    self[length - 1] = nil
    self.length -= 1
    popped
  end

  def unshift(value)
    resize! if length == capacity

    self.length += 1

    i = self.length - 2
    while i >= 0
      self[i + 1] = self[i]
      i -= 1
    end

    self[0] = value
    nil
  end

  def shift
    raise "index out of bounds" if length == 0
    shifted = self[0]
    i = 0
    while i < self.length - 1
      self[i] = self[i + 1]
      i += 1
    end
    self.length -= 1
    shifted
  end

  protected
  attr_accessor :capacity, :store
  attr_writer :length

  def resize!
    new_capacity = capacity * 2
    new_store = StaticArray.new(new_capacity)
    length.times { |i| new_store[i] = self[i] }

    self.capacity = new_capacity
    self.store = new_store
  end
end
