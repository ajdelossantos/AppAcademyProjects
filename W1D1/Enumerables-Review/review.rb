def factors(num)
  (1..num).select do |el|
    num % el == 0
  end
end

class Array
  def bubble_sort!(&prc)
    prc ||= Proc.new { |el1, el2| (el1 <=> el2) }
    sorted = true

    while sorted
      sorted = false

      self.each_index do |idx|
        jdx = idx + 1
        break if jdx == self.size

        if prc.call(self[idx], self[jdx]) == 1
          self[idx], self[jdx] = self[jdx], self[idx]
          sorted = true
        else
          next
        end
      end
    end


    p self
  end

  def bubble_sort(&prc)
    self.dup.bubble_sort!(&prc)
  end
end

def subwords(string, dictionary)
  dictionary.select do |word|

  end
end

def substrings(string)
end

#substrings(string)
#subwords(word, dictionary)

test_case = [1, 2, 3, 4, 5].shuffle
p test_case.bubble_sort { |num1, num2| num2**2 <=> num1**2 }
p test_case
