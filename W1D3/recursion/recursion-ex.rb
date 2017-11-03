require 'byebug'

def range_recursive(first, last)
  return [] if last <= first
  range_recursive(first, last - 1) + [last - 1]
end

def range_iterative(first, last)
  result = []
  (last - 1).times do
    result << first
    first += 1
  end

  result
end

def exponent(b, n)
  return 1 if n == 0
  return 1.fdiv(exponent(b, n.abs - 1) * b) if n < 0
  b * exponent(b, n - 1)
end

def exponent_alt(b, n)
  exponent(b, n) if n < 0
  return 1 if n == 0
  return b if n == 1

  n.even? ? exponent_alt(b, n / 2)**2 : b * (exponent_alt(b, (n - 1) / 2)**2)
end

class Array
  def deep_dup
    # self.map {|el| el.is_a?(Array) ? el.deep_dup : el}
    copy = []
    self.each do |el|
      if el.is_a?(Array)
        copy << el.deep_dup
      else
        copy << el
      end
    end

    copy
  end
end

# def fib_gets(n)
#   # return nil if n == 0
#   return 0 if n == 1
#   return 1 if n == 2
#   fib_gets(n - 1) + fib_gets(n - 2)
# end

def fibonacci_r(n)
  return [] if n == 0
  return [0] if n == 1
  return [0, 1] if n == 2

  fibs = fibonacci_r(n - 1)
  fibs << fibs[-1] + fibs[-2]
end

def fibonacci_i(n)
  return [] if n == 0
  return [0] if n == 1

  initial = [0, 1]

  (n - 2).times do
    initial << initial[-1] + initial[-2]
  end

  initial
end

class Array
  def subsets
    # empty set is always a subset...
    return [[]] if self.empty?

    # all subsets of all but the last element of self
    sub_s = self[0...-1].subsets
    sub_s + sub_s.map { |el| el + [self.last] }
  end
end

def permutations(array)
  return [array] if array.length < 2
  first = array.shift
  perms = permutations(array)
  all_permutations = []

  perms.each do |perm|
    (0..perm.size).each do |idx|
      all_permutations << perm[0...idx] + [first] + perm[idx..-1]
    end
  end

  all_permutations

end

def bsearch_i(array, target)
  # search space == left and right indices
  # first and last elements on first pass
  # left = 0; right = length - 1
  # middle = mean(left, right)

  left_idx = 0
  right_idx = array.length - 1

  while left_idx <= right_idx
    # search_idx is mean(left_idx, right_idx).floor
    search_idx = (left_idx + right_idx) / 2

    if array[search_idx] == target
      return search_idx
    elsif array[search_idx] > target
      right_idx = search_idx - 1
    elsif array[search_idx] < target
      left_idx = search_idx + 1
    end

  end

  nil
end

def bsearch_r(array, target)
  return nil if array - [target] == array
  return 0 if array.length == 1

  m = array.length/2

  if array[m] == target
    return m
  elsif array[m] > target
    bsearch_r(array[0...m], target)
  elsif array[m] < target
    bsearch_r(array[m + 1..-1], target) + array[0..m].length
  end

end

class Array
  def my_merge_sort
    return self if self.length <= 1
    mid = length / 2

    sorted_left = self.take(mid).my_merge_sort
    sorted_right = self.drop(mid).my_merge_sort

    Array.my_merge(sorted_left, sorted_right)
  end

  def self.my_merge(left, right)
    merged = []

    until left.empty? || right.empty?
      case left.first <=> right.first
      when -1
        merged << left.shift
      when 0
        merged << left.shift
      when 1
        merged << right.shift
      end
    end

    merged + (left + right)
  end
end
