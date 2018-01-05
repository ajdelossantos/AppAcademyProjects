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
    @store[0], @store[-1] = @store[-1], @store[0]
    extracted = @store.pop
    BinaryMinHeap.heapify_down(@store, 0, &@prc)
    extracted
  end

  # O(1)
  def peek
    @store.first
  end

  # O(log(n)) AKA insert
  def push(val)
    @store.push(val)
    BinaryMinHeap.heapify_up(@store, @store.length - 1, &@prc)
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
    child_indices = BinaryMinHeap.child_indices(len, parent_idx)

    while (child_indices[0] && prc.call(array[parent_idx], array[child_indices[0]]) == 1) ||
            (child_indices[1] && prc.call(array[parent_idx], array[child_indices[1]]) == 1)

      break if parent_idx >= len
      if child_indices.length == 1 || prc.call(array[child_indices[0]], array[child_indices[1]]) == -1
        array[parent_idx], array[child_indices[0]] = array[child_indices[0]], array[parent_idx]
        parent_idx = child_indices[0]
      else
        array[parent_idx], array[child_indices[1]] = array[child_indices[1]], array[parent_idx]
        parent_idx = child_indices[1]
      end

      child_indices = BinaryMinHeap.child_indices(len, parent_idx)
    end

    array
  end

  def self.heapify_up(array, child_idx, len = array.length, &prc)
    return array if child_idx == 0

    prc ||= Proc.new { |x, y| x <=> y }
    parent_index = BinaryMinHeap.parent_index(child_idx)

    until child_idx == 0 || prc.call(array[parent_index], array[child_idx]) == -1
      array[parent_index], array[child_idx] = array[child_idx], array[parent_index]
      child_idx = parent_index

      child_idx == 0 ? break : parent_index = BinaryMinHeap.parent_index(child_idx)
    end

    array
  end
end
