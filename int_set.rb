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
  # 20 is arbitrary
  def initialize(num_buckets = 20)
    @store = Array.new(20) { Array.new }
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
