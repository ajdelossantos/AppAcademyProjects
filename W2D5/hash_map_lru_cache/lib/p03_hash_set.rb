require_relative 'p02_hashing'

class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    num = key.hash
    return if self.include?(key)

    resize! if @count >= num_buckets

    self[num] << key
    @count += 1
  end

  def include?(key)
    num = key.hash
    self[num].include?(key)
  end

  def remove(key)
    num = key.hash
    return unless self.include?(key)
    self[num].delete(key)
    @count -= 1
  end

  private

  def [](num)
    @store[num % num_buckets]
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    keys = @store.flatten
    @store = Array.new(2 * num_buckets) { Array.new }
    @count = 0
    keys.each { |key| self.insert(key) }
  end
end
