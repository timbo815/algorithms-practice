class Array
  def merge_sort
    return self if count < 2

    left, right = self.take(count / 2), self.drop(count / 2)
    sorted_left, sorted_right = left.merge_sort, right.merge_sort
    merge(sorted_left, sorted_right)
  end

  def merge(left, right)
    merged = []

    until left.empty? || right.empty?
      if left.first < right.first
        merged << left.shift
      else
        merged << right.shift
      end
    end

    merged + left + right
  end
end
