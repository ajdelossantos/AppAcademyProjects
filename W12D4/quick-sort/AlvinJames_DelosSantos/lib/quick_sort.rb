class QuickSort
  # Quick sort has average case time complexity O(nlogn), but worst
  # case O(n**2).

  # Not in-place. Uses O(n) memory.
  def self.sort1(array, &prc)
    prc ||= proc { |x, y| x <=> y }

    return array if array.length <= 1

    pivot = array.first
    left = array[1..-1].select{ |el| prc.call(el, pivot) == -1 }
    right = array[1..-1].select{ |el| prc.call(el, pivot) != -1 }

    self.sort1(left, &prc) + [pivot] + self.sort1(right, &prc)
  end

  # In-place.
  def self.sort2!(array, start = 0, length = array.length, &prc)
    prc ||= proc { |x, y| x <=> y }
    
    return array if length <= 1

    pivot_idx = self.partition(array, start, length, &prc)
    left_partition_len = pivot_idx - start
    right_partition_len = length - pivot_idx - 1

    self.sort2!(array, start, left_partition_len, &prc)
    self.sort2!(array, (pivot_idx + 1), right_partition_len, &prc)
  end

  def self.partition(array, start, length, &prc)
    prc ||= proc { |x, y| x <=> y }

    pivot_idx = start
    pivot_el = array[start]
    range = (start + 1...start + length)

    range.each do |idx|
      if prc.call(pivot_el, array[idx]) > 0
        array[pivot_idx + 1], array[idx] = array[idx], array[pivot_idx + 1]
        pivot_idx += 1
      end
    end
    
    array[pivot_idx], array[start] = array[start], array[pivot_idx]
    pivot_idx
  end
end
