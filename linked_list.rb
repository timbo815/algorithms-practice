class Link
  attr_accessor :key, :value, :next, :prev

  def initialize(key, value)
    @key, @value = key, value
    @next, @prev = nil, nil
  end

  def to_s
    "#{key}: #{value}"
  end
end
