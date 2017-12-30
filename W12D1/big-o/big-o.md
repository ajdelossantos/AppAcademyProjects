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
  # O(n)
  arr.each do |el|
    break if el == arr.length/2 - 1
    puts el
  end

  # O(n)
  arr.each_with_index do |el, idx|
    puts el if idx % 3 == 0
  end

  # O(1)
  puts arr.last
end
```

* n depends on the number of elements in the array
* O(n + 1), then O(n + n/3), then 0(1) => still O(n)
* at worst, it iterates through all the elements in the array in the first operation--it will iterate through the array in the second part of the function and then select (in constant time) the last element of the array
* this still takes up n space, dependent on the size of the array

#### 6.

```ruby
def search(arr, target)
  arr.each_with_index do |el, idx|
    return idx if el == target
  end
end
```

* n here is dependent on the size of the array
* O(n), traversing the array looking for the target in the array, stopping if it finds it
* at worst, it traverses the whole array
* this takes up n space for the array, 1 for the target, and 1 for the reurn value if it's found

#### 7.

```ruby
def searchity_search(arr, target)
  results = []
  arr.each do |el|
    results << search(arr, target + el)
  end

  results  
end
```

* n here is dependent on the size of the array
* O(n^2), traversing the array for each element in the array searching for (target + el)
* at worst, the function never finds anything to push into the results array and runs its course
* this function will, at worst, take up 2n space

#### 8.

```ruby
def searchity_search_2(arr, target)
  results = []
  arr.each do |el|
    results << search(arr, el)
  end

  results  
end
```

* n is dependent on the size of the array, again
* O(n^2), traversing the array for each element in the array and pushing it into the new array, effectively deep duping it
* this function consistently duplicates the array, so the worst case is the same as any other case
* this function takes up 2n space, always

### Iterations

#### 1.

```javascript
let iterative_1 = (n, m) => {
  let notes = ["do", "re", "mi", "fa", "sol", "la", "ti", "do"];

  for (var i = 0; i < n; i++) {
    for (var j = 0; j < m; j++) {
      let position = (i + j) % 8;
      console.log(notes[position]);
    }
  }
};
```

def rec_mystery(n)
return n if n < 5

rec_mystery(n - 5)
end

O(n/5) => O(n) for n >= 5
O(1) for n < 5
NB: n < 0 will always return n
NB2: call it mod_5_rec

def rec_mystery_2(n)
return 0 if n == 0

rec_mystery_2(n/5) + 1
end

returns 0 or 1
O(log(n)) (base 5)

def rec_mystery_3(n, m, o)
if n <= 0
printf("%d, %d\n", m, o)
else
rec_mystery_3(n-1, m+1, o)
rec_mystery_3(n-1, m, o+1)
end
end

O(k^n)

```javascript
Array.prototype.grabBag = function() {
  if (this.length === 0) {
    return [[]];
  }
  let bag = this.slice(this.length - 1).grabBag();
  return bag.concat(
    bag.map(function(el) {
      return el + [this.length - 1];
    })
  );
};
```

const arr = [1,2,3]
arr.grabBag();
