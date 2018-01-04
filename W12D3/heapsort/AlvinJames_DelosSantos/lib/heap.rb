class BinaryMinHeap
  attr_reader :store, :prc

  def initialize(&prc)
    @prc = prc || Proc.new { |x, y| x <=> y }
    @store = Array.new
  end

  def count
    @store.length
  end

  # O(log(n))
  def extract
    # swap first and last, pop, then heapify down
  end

  # O(1)
  def peek
    @store.first
  end

  # O(log(n)) AKA insert
  def push(val)
    # push, then heapify up
  end

  public

  def self.child_indices(len, parent_index)
    child_indices = []
    
    first_child = (2 * parent_index) + 1
    child_indices << first_child if first_child < len + 1
    
    next_child = (2 * parent_index) + 2
    child_indices << next_child if next_child < len

    child_indices
  end

  def self.parent_index(child_index)
    raise "root has no parent" if child_index == 0
    (child_index - 1) / 2
  end

  def self.heapify_down(array, parent_idx, len = array.length, &prc)
    prc ||= Proc.new { |x, y| x <=> y }
    children = BinaryMinHeap.child_indices(len, parent_idx)




    children.each do |child_idx|
      # p prc.call(array[parent_idx], array[child_idx])
      if prc.call(array[parent_idx], array[child_idx]) == 1
        p array[parent_idx], array[child_idx] = array[child_idx], array[parent_idx]
      end
    end

  end

  def self.heapify_up(array, child_idx, len = array.length, &prc)
  end
end
