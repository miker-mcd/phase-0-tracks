### Release 0 Simple Search

# p search_array(arr, 1)
# p search_array(arr, 24)
# don't use built-in array methods like .index

arr = [42, 89, 23, 1]

# method that takes array of integers and an integer to search for.
# output: index of item or nil if item is not present in the array.

def search_array(arr, x)
count = 0
while count < arr.length
  if x == arr[count]
    p count
  elsif arr[0..-1] == x
    arr[x]
  end
count += 1
end
end

# p search_array(arr, 1)
# p search_array(arr, 24)

# Why do both declarations return: 3, nil, nil, ' '? - p returns nil, but second p return ' '.

### Release 1 Calculate Fibonacci Numbers

# Start with an array of 0 and 1 and add new numbers into the array by adding the previous two. Each number in the array is the sum of the previous two numbers, except for 0 and 1.

# Method that TAKES a NUMBER of Fibonacci terms to generate and RETURNS an array of the terms.
# fib(6) => [0,1,1,2,3,5]
# fib(100) => [0,1,..218922995834555169026]
# x = number of times to add a new number.

def fib
  fibo_arr = [2, 3]
  fibo_arr.each do |number|
  var = fibo_arr[fibo_arr.index(number) - 1]
  p number + var
  end
end

p fib