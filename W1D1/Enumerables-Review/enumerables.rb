class Array
  def my_each(&prc)
    # if block_given?
    #   idx = 0
    #   while idx < self.length
    #     prc.call(self[idx])
    #     idx += 1
    #   end
    # else
    #   raise "No block given."
    # end

    self.length.times do |i|
      prc.call(self[i])
    end

    self
  end

  def my_select(&prc)
    result = []

    self.my_each do |el|
      result << el if prc.call(el)
    end

    result
  end

  def my_reject(&prc)
    result = []

    self.my_each do |el|
      # result << el if !prc.call(el)
      result << el unless prc.call(el)
    end

    result
  end

  def my_any?(&prc)
    self.my_each do |el|
      return true if prc.call(el)
    end

    false
  end

  def my_all?(&prc)
    self.my_each do |el|
      # return false if !prc.call(el)
      return false unless prc.call(el)
    end

    true
  end

  def my_flatten
    result = []
    # idx = 0
    #
    # while idx < self.length
    #   if self[idx].is_a?(Array)
    #     self[idx].my_flatten.each do |el|
    #       result << el
    #     end
    #
    #   else
    #     result << self[idx]
    #   end
    #
    #   idx += 1
    # end
    self.my_each do |el|
      if el.is_a?(Array)
        # Array#+ alias for Array#concat
        # [a, b] + [c, d] => [a, b, c, d]
        result + el.my_flatten
      else
        result << el
      end
    end

    result
  end

  def my_zip(*arrays)
    result = []
    # idx = 0
    # self.my_each do |el|
    #   temp = []
    #   temp << el
    #
    #   arrays.my_each do |array|
    #     temp << array[idx]
    #   end
    #
    #   result << temp.my_flatten
    #   idx += 1
    # end
    self.length.times do |i| # Uses the self.length.times { |i| ... } trick.
      temp = [self[i]]

      arrays.my_each do |arr|
        temp << arr[i]
      end

      result << temp
    end

    result
  end

  def my_rotate(num = 1)
    result = self

    num = num % self.size

    num.times do
      temp_var = result.shift
      result.push(temp_var)
    end

    result
  end

  def my_rotate_alt(pos = 1)
    split_idx = pos % self.length

    self.drop(split_idx) + self.take(split_idx)
    # Array#drop drops first n elements, returns result
    # Array#take takes first n elements, returns result
    # Array#+ puts them back together
  end

  def my_join(delimiter = "")
    result = ""

    idx = 0
    self.my_each do |char|
      if idx < self.size - 1
        result << char + delimiter
      else
        result << char
      end

      idx += 1
    end

    result
  end

  def my_reverse
    result = []

    # idx = self.length - 1
    # until idx < 0
    #   result << self[idx]
    #   idx -= 1
    # end

    self.my_each do |el|
      result.unshift(el)
    end

    result
  end
end
