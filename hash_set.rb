#hashes values to allow for any data type to be inserted in the set
class HashSet
  attr_reader :count

  def initialize(num_buckets = 10)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(value)
    return false if include?(value)
    self[value.hash] << value
    @count += 1
    resize! if @count > num_buckets

    value
  end


  def remove(value)
    return false unless self[value].include?(value)
    self[value.hash].delete(value)
    @count -= 1
  end

  def include?(value)
    self[value.hash].include?(value)
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
