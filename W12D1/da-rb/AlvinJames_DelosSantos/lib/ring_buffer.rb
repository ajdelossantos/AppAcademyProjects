require_relative "static_array"
require "byebug"

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
    @store[calc_idx(@start_idx, index)]
  end

  # O(1)
  def []=(index, value)
    check_index(index)
    @store[calc_idx(@start_idx, index)] = value
  end

  # O(1)
  def pop
    check_length
    last = @store[end_idx]
    @store[end_idx] = nil

    @length -= 1
    last
  end

  # O(1) ammortized
  def push(val)
    resize! if @length == @capacity

    if @length == 0
      @store[@start_idx] = val
    else
      @store[end_idx + 1] = val
    end
    
    @length += 1
    @store
  end

  # O(1)
  def shift
    check_length
    first = @store[@start_idx]
    @store[@start_idx] = nil
    @start_idx = calc_idx(@start_idx, 1)

    @length -= 1
    first
  end

  # O(1) ammortized
  def unshift(val)
    resize! if @length == @capacity

    @start_idx = calc_idx(@start_idx, -1)
    @store[@start_idx] = val

    @length += 1
    @store
  end

  protected
  attr_accessor :capacity, :start_idx, :store
  attr_writer :length

  def end_idx
    @length == 0 ? @start_idx : (@start_idx + @length - 1) % @capacity
  end

  # Accepts negative ints
  def calc_idx(index, int)
    (index + int) % @capacity
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
    j = @start_idx
    while i < @length
      @store[i] = temp_arr[j % @length]
      i += 1
      j += 1
    end

    @start_idx = 0
  end
end
