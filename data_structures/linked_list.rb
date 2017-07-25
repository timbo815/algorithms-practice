class Link
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil , val = nil)
    @key, @val = key, val
    @next, @prev = nil, nil
  end

  def to_s
    "#{key}: #{val}"
  end

  def remove
    self.prev.next = self.next if self.prev
    self.next.prev = self.prev if self.next
    self.next = nil
    self.prev = nil
    self
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
    each do |link|
      if link.key == key
        return link.val
      end
    end

    nil
  end

  def include?(key)
    each do |link|
      if link.key == key
        return true
      end
    end

    return false
  end

  def append(key, val)
    new_link = Link.new(key, val)
    self.last.next = new_link
    new_link.prev = self.last
    new_link.next = @tail
    @tail.prev = new_link
    new_link
  end

  def update(key, val)
    each do |link|
      if link.key == key
        link.val = val
      end
    end
  end

  def remove(key)
    each do |link|
      if link.key == key
        new_prev = link.prev
        new_next = link.next

        new_prev.next = new_next
        new_next.prev = new_prev

        link.prev = nil
        link.next = nil
        return
      end
    end
  end

  def each
    current_link = first
    while current_link != @tail
      yield current_link
      current_link = current_link.next
    end
  end
end
