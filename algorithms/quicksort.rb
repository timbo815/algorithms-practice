class QuickSort
  # Quick sort has average case time complexity O(nlogn), but worst
  # case O(n**2).

  # Not in-place. Uses O(n) memory.
  def self.sort1(array)
    return array if array.length <= 1

    pivot = array[0]

    left_array = []
    right_array = []

    array[1..array.length].each do |el|
      left_array << el if el < pivot
      right_array << el if el > pivot
    end

    sort1(left_array) + [pivot] + sort1(right_array)
  end

  # In-place.
  def self.sort2!(array, start = 0, length = array.length, &prc)
    return array if length <= 1
    pivot_idx = partition(array, start, length)

    left_length = pivot_idx - start
    right_length = length - (left_length + 1)

    sort2!(array, start, left_length)
    sort2!(array, pivot_idx + 1, right_length)

    array
   end

  def self.partition(array, start, length, &prc)
    pivot_el = array[start]
    (start + 1).upto(start + length - 1).each do |idx|
      if array[idx] > pivot_el
      else
        array[idx], array[start + 1] = array[start + 1], array[idx]
        array[start], array[start + 1] = array[start + 1], array[start]
        start += 1
      end
    end
    start
  end
end
