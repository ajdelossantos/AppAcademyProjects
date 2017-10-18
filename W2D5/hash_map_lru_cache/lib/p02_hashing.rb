class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    result = ""

    self.each do |el|
      result += (el.hash % self.length).to_s
    end

    result.hash
  end
end

class String
  def hash
    num_str = ""

    self.chars.each do |char|
      num_str += char.ord.to_s
    end

    num_str.to_i.hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    self.to_a.sort.hash
  end
end
