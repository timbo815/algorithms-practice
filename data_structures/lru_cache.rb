require_relative 'hash_map'
require_relative 'linked_list'

class LRUCache
  def initialize(max, prc)
    @map = HashMap.new
    @store = LinkedList.new
    @max = max
    @prc = prc
  end

  def count
    @map.count
  end

  def get(key)
    link = @map[key]
    if link
      link.remove
      @store.append(link.key, link.val)
      return @store[link.key]
    else
      calc!(key)
    end
  end

  def to_s
    "Map: " + @map.to_s + "\n" + "Store: " + @store.to_s
  end

  private

  def calc!(key)
    result = @prc.call(key)
    new_link = @store.append(key, result)
    @map[key] = new_link
    if @store.count > @max
      eject!
    end

    result
  end
  
  def eject!
    least_recently_used = @store.first
    least_recently_used.remove
    @map.delete(least_recently_used.key)
    nil
  end
end
