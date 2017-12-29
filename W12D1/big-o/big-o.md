## Big O Project

### Arrays

* A. Specify which aspect (or aspects) of the input the time complexity depends on. E.g., if a function is O(n), what is n?

* B. Explain thoroughly and clearly why the time complexity is what it is.

* C. Find the worst cases.

* D. Discuss space complexity too: this is usually deemphasized over time complexity, but some interviewers will ask about it.

#### 1.

```ruby
def add(a, b)
  a > b ? a + b : a - b
end
```

* n depends on the number of arguments: there are strictly 2 args here
* O(1); this is in constant time because there are always two arguments and two operations: the comparison then an arithmetic operation
* time complexity is fixed at two total operations; best case and worst case are the same
* space complexity is fixed at three memory positions, assuming that a and b are not arbitrarily large numbers

#### 2.

```ruby
def print_arr_1(arr)
  arr.each do |idx|
    puts el
  end
end
```

* n depends on the number of elements in the array
* O(n); this function iterates through each element in the array 0(n) and prints its value O(1)
* this function will always iterate through the entire array; best case and worst case are the same
* space complexity is dependent on the array size

#### 3.

```ruby
def print_arr_2(arr)
  arr.each_with_index do |el, idx|
    break if idx == arr.length/2 - 1
    puts el
  end
end
```

* n depends on the number of elements in the array
* O(2n/2) => O(n); this function will only iterate through 1/2 the number of elements
* at worst, it iterates through half the elements in the array
* this takes up n space, dependent on the size of the array

#### 4.

```ruby
def print_arr_3(arr)
  arr.each do |el|
    break if el == arr.length/2 - 1
    puts el
  end
end
```

* n depends on the number of elements in the array
* O(2n) => 0(n); there's no gurantee that (arr.length/2 - 1) is an element of the array
* at worst, it iterates through all the elements in the array
* this takes up n space, dependent on the size of the array

#### 5.

```ruby
def print_arr_4(arr)
  arr.each do |el|
    break if el == arr.length/2 - 1
    puts el
  end

  arr.each_with_index do |el, idx|
    puts el if idx % 3 == 0
  end

  puts arr.last
end
```
