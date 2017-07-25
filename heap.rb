class BinaryMinHeap
  def initialize(&prc)
    @store = []
  end

  def count
    store.length
  end

  def extract
    raise "no element to extract" if count == 0

    if count > 1
      extracted = store[0]
      store[0] = store.pop
      BinaryMinHeap.heapify_down(store, 0, store.length)
      extracted
    else
      store.pop
    end
  end

  def peek
    raise "no element to peek" if count == 0
    store[0]
  end

  def push(val)
    store.push(val)
    BinaryMinHeap.heapify_up(store, store.length - 1, store.length)
  end

  protected
  attr_accessor :prc, :store

  public
  def self.child_indices(len, parent_index)
    child_indices = []
    child_1 = 2 * parent_index + 1
    child_2 = 2 * parent_index + 2
    [child_1, child_2].each do |index|
      child_indices << index if index < len
    end

    child_indices
  end

  def self.parent_index(child_index)
    raise "root has no parent" if child_index == 0
    (child_index - 1) / 2
  end

  def self.heapify_down(array, parent_idx, len = array.length)
    indices_to_check = child_indices(len, parent_idx).sort
    child_values = []
    if indices_to_check[0]
      child_values << array[indices_to_check[0]]
    end

    if indices_to_check[1]
      child_values << array[indices_to_check[1]]
    end

    if child_values[0] && (array[parent_idx] > child_values[0])
      array[parent_idx], array[indices_to_check[0]] = array[indices_to_check[0]], array[parent_idx]
      heapify_down(array, child_values[0], len)
    elsif child_values[1] && array[parent_idx] > child_values[1]
      array[parent_idx], array[indices_to_check[1]] = array[indices_to_check[1]], array[parent_idx]
      heapify_down(array, child_values[1], len)
    else
      return array
    end
  end

  def self.heapify_up(array, child_idx, len = array.length)
    if child_idx != 0 && (array[parent_index(child_idx)] > array[child_idx])
      array[parent_index(child_idx)], array[child_idx] = array[child_idx], array[parent_index(child_idx)]
      heapify_up(array, parent_index(child_idx), len)
    end

    return array
  end
end
