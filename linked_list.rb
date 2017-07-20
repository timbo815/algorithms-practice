class Link
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil , val = nil)
    @key, @val = key, val
    @next, @prev = nil, nil
  end

  def to_s
    "#{key}: #{val}"
  end
end

class LinkedList
  include Enumerable

  attr_reader :head, :tail

  def initialize
    @head = Link.new
    @tail = Link.new
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head.next.nil? ? @head : @head.next
  end

  def last
    @tail.prev.nil? ? @tail : @tail.prev
  end

  def empty?
    head.next == tail
  end

  def get(key)
    current_link = first
    while current_link != @tail
      if current_link.key == key
        return current_link.val
      end

      current_link = current_link.next
    end

    nil
  end

  def include?(key)
    current_link = first
    while current_link != @tail
      if current_link.key == key
        return true
      end

      current_link = current_link.next
    end

    return false
  end

  def append(key, val)
    new_link = Link.new(key, val)
    self.last.next = new_link
    new_link.prev = self.last
    new_link.next = @tail
    @tail.prev = new_link
  end

  def update(key, val)
    current_link = first
    while current_link != @tail
      if current_link.key == key
        current_link.val = val
        return true
      end

      current_link = current_link.next
    end

    return false
  end

  def remove(key)
    current_link = first
    while current_link != @tail
      if current_link.key == key
        new_prev = current_link.prev
        new_next = current_link.next

        new_prev.next = new_next
        new_next.prev = new_prev

        current_link.prev = nil
        current_link.next = nil
        return true
      end

      current_link = current_link.next
    end

    return false
  end
end
