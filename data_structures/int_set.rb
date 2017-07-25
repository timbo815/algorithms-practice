class MaxIntSet
  attr_accessor :store
  attr_reader :max

  def initialize(max)
    @max = max
    @store = Array.new(max, false)
  end

  def insert(value)
    check_index(value)
    store[value] = true
  end

  def remove(value)
    check_index(value)
    store[value] = false
  end

  def include?(value)
    check_index(value)
    store[value]
  end

  private

  def check_index(value)
    raise "Out of bounds" unless (value >= 0) && (value <= max)
  end
end

class IntSet
  attr_reader :store
  # 10 is arbitrary
  def initialize(num_buckets = 10)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(value)
    self[value] << value unless self[value].include?(value)
  end

  def remove(value)
    self[value].delete(value)
  end

  def include?(value)
    self[value].include?(value)
  end

  private

  def [](value)
    store[value % num_buckets]
  end

  def num_buckets
    store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 10)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(value)
    return false if include?(value)
    self[value] << value
    @count += 1
    resize! if @count > num_buckets

    value
  end


  def remove(value)
    return false unless self[value].include?(value)
    self[value].delete(value)
    @count -= 1
  end

  def include?(value)
    self[value].include?(value)
  end

  private

  def [](value)
    @store[value % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    old_store = @store
    @count = 0
    @store = Array.new(num_buckets * 2) { Array.new }

    old_store.each do |bucket|
      bucket.each do |el|
        insert(el)
      end
    end
  end
end
