require_relative "heap"

class Array
  def heap_sort!
    # max heap
    max_prc = Proc.new { |x, y| y <=> x }
    
    heapify_idx = 0
    while heapify_idx < length
      BinaryMinHeap.heapify_up(self, heapify_idx, &max_prc)
      heapify_idx += 1
    end
    # puts "After heapify: "
    # p self
    # puts ""

    extract_idx = self.length - 1
    until extract_idx == 0
      self[extract_idx], self[0] = self[0], self[extract_idx]
      puts "swapped: "
      p self
      puts ""
      
      extract_idx -= 1
      puts "heapify_down: "
      p BinaryMinHeap.heapify_down(self, 0, extract_idx, &max_prc)
      puts ""
    end

    self
  end
end