# TDD EX

class Array
  def my_uniq
    hash = Hash.new(0)

    self.each do |el|
      hash[el] += 1
    end

    hash.keys
  end

  def two_sum

    result = []

    self.each_index do |i|
      self.each_index do |j|
        next if j <= i
        break if i == self.length - 1
        result << [i, j] if self[i] + self[j] == 0
      end
    end

    result
  end

end
