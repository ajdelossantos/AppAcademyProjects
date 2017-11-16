MAX_STACK_SIZE = 200
tracer = proc do |event|
  if event == 'call' && caller_locations.length > MAX_STACK_SIZE
    fail "Probable Stack Overflow"
  end
end
set_trace_func(tracer)

def sum_to(num)
  return nil if num < 0
  return num if num <= 1
  # sum_to(2) => 2 + 1     == 2 + sum_to(2 - 1)
  # sum_to(3) => 3 + 2 + 1 == 3 + sum_to(3 - 1)
  num + sum_to(num - 1)
end

# # Test Cases
# p sum_to(5)  # => returns 15
# p sum_to(1)  # => returns 1
# p sum_to(9)  # => returns 45
# p sum_to(-8)  # => returns nil

def add_numbers(num_array)
  num_array = num_array.dup
  return num_array.first if num_array.length <= 1
  # add_numbers([2, 2])       => 4 == 2 + add_numbers([2])
  # add_numbers([2, 2, 2])    => 6 == 2 + add_numbers([2, 2])
  # add_numbers([2, 2, 2, 2]) => 8 == 2 + add_numbers([2, 2, 2])
  num_array.first + add_numbers(num_array.drop(1))
end

# Test Cases
# p add_numbers([1,2,3,4]) # => returns 10
# p add_numbers([3]) # => returns 3
# p add_numbers([-80,34,7]) # => returns -39
# p add_numbers([]) # => returns nil

def gamma_fnc(num)
  return nil if num < 0
  return num if num <= 1
  # gamma(8)         ==     factorial(7)
  # factorial(7)     == 7 * factorial(6)
  # 7 * factorial(6) == 7 * gamma(7)
  (num - 1) * gamma_fnc(num - 1)
end

# # Test Cases
# p gamma_fnc(0)  # => returns nil
# p gamma_fnc(1)  # => returns 1
# p gamma_fnc(4)  # => returns 6
# p gamma_fnc(8)  # => returns 5040

# recursive flavors.include?(favorite)
def ice_cream_shop(flavors, favorite)
  flavors = flavors.dup
  return false if flavors.empty?

  if flavors.last == favorite
    return true
  else
    flavors.pop
    ice_cream_shop(flavors, favorite)
  end
end

# # Test Cases
# p ice_cream_shop(['vanilla', 'strawberry'], 'blue moon')  # => returns false
# p ice_cream_shop(['pistachio', 'green tea', 'chocolate', 'mint chip'], 'green tea')  # => returns true
# p ice_cream_shop(['cookies n cream', 'blue moon', 'superman', 'honey lavender', 'sea salt caramel'], 'pistachio')  # => returns false
# p ice_cream_shop(['moose tracks'], 'moose tracks')  # => returns true
# p ice_cream_shop([], 'honey lavender')  # => returns false

def reverse(string)
  return string if string.length == 0
  string[-1] + reverse(string[0..-2])
end

# # Test Cases
# p reverse("house") # => "esuoh"
# p reverse("dog") # => "god"
# p reverse("atom") # => "mota"
# p reverse("q") # => "q"
# p reverse("id") # => "di"
# p reverse("") # => ""
