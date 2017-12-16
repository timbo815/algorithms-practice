# testing github api
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
    left_child_index, right_child_index = child_indices(len, parent_idx)
    parent_value = array[parent_idx]
    child_values = []
    child_values << array[left_child_index] if left_child_index
    child_values << array[right_child_index] if right_child_index

    return array if child_values.all? { |val| val > array[parent_idx] }
    swap_index = nil
    if child_values.length == 1
      swap_idx = left_child_index
    else
      swap_idx = (child_values[0] < child_values[1]) ? left_child_index : right_child_index
    end


    array[parent_idx], array[swap_idx] = array[swap_idx], parent_value
    heapify_down(array, swap_idx, len)
  end

  def self.heapify_up(array, child_idx, len = array.length)
    if child_idx != 0 && (array[parent_index(child_idx)] > array[child_idx])
      array[parent_index(child_idx)], array[child_idx] = array[child_idx], array[parent_index(child_idx)]
      heapify_up(array, parent_index(child_idx), len)
    end

    return array
  end
end
