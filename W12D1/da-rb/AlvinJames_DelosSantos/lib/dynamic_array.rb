require_relative "static_array"

class DynamicArray
  attr_reader :length

  def initialize
    @store = StaticArray.new(8)
    @capacity = 8
    @length = 0
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
    last_idx = @length - 1
    last = @store[last_idx]

    @store[last_idx] = nil
    @length -= 1
    
    last
  end

  # O(1) ammortized; O(n) worst case. Variable because of the possible
  # resize.
  def push(val)
    resize! if @length == @capacity
    
    @store[@length] = val
    @length += 1
    
    @store
  end

  # O(n): has to shift over all the elements.
  def shift
    check_length
    
    first = @store[0]
    temp_arr = StaticArray.new(@capacity)

    i = 1
    while i < @length
      temp_arr[i - 1] = @store[i]
      i += 1
    end

    @store = temp_arr
    @length -= 1

    first
  end

  # O(n): has to shift over all the elements.
  def unshift(val)
    resize! if @length == @capacity
    
    temp_arr = @store
    @store = StaticArray.new(@capacity)
    @store[0] = val

    i = 0
    while i < @length
      @store[i + 1] = temp_arr[i]
      i += 1
    end

    @length += 1
    @store
  end

  protected

  attr_accessor :capacity, :store
  attr_writer :length

  def check_index(index)
    raise "index out of bounds" if index >= @length
  end

  def check_length
    raise "index out of bounds" if @length == 0
  end

  # O(n): has to copy over all the elements to the new store.
  def resize!
    temp_arr = @store
    @capacity *= 2
    @store = StaticArray.new(@capacity)

    i = 0
    while i < @length
      @store[i] = temp_arr[i]
      i += 1
    end
  end
end
