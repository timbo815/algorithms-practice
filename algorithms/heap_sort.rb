require_relative '../data_structures/heap.rb'
#adding comment to test pull requrest api
class Array
  def heap_sort!
    2.upto(count).each do |heap_size|
      BinaryMinHeap.heapify_up(self, heap_size - 1, heap_size)
    end

    count.downto(2).each do |heap_size|
      self[0], self[heap_size - 1] = self[heap_size - 1], self[0]
      BinaryMinHeap.heapify_down(self, 0, heap_size - 1)
    end

    self.reverse!
  end
end
