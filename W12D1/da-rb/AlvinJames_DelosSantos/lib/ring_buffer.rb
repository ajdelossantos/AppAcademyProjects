require_relative "static_array"

class RingBuffer
  attr_reader :length

  def initialize
    @store = StaticArray.new(8)
    @capacity = 8
    @length = 0
    @start_idx = 0
  end

  # O(1)
  def [](index)
    check_index(index)
    @store[index]
  end

  # O(1)
  def []=(index, value)
    check_index(index)
    @store[index] = value
  end

  # O(1)
  def pop
    check_length
    last = @store[end_idx]
    @store[end_idx] = nil

    @length -= 1
    p last
  end

  # O(1) ammortized
  def push(val)
    resize! if @length == @capacity
    @store[end_idx] = val

    @length += 1
    p @store
  end

  # O(1)
  def shift
    check_length
  end

  # O(1) ammortized
  def unshift(val)
  end

  protected
  attr_accessor :capacity, :start_idx, :store
  attr_writer :length

  def end_idx
    return @start_idx if @length == 0
    (@start_idx + @length) % @capacity
  end

  # Accepts negative ints
  def calc_idx(index, int)
    (index + int - 1) / @capacity
  end

  def check_index(index)
    raise "index out of bounds" if index >= @length
  end

  def check_length
    raise "index out of bounds" if @length == 0
  end

  def resize!
    temp_arr = @store
    @capacity *= 2
    @store = StaticArray.new(@capacity)

    i = 0
    while i < @length
      @store[i] = temp_arr[i]
      i += 1
    end
    
    @start_idx = 0
  end
end
