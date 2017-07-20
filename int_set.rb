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
