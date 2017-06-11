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
  end
count += 1
  end
end

# p search_array(arr, 89)
# p search_array(arr, 24)

### Release 1 Calculate Fibonacci Numbers

# Start with an array of 0 and 1 and add new numbers into the array by adding the previous two. Each number in the array is the sum of the previous two numbers, except for 0 and 1.

# Method that TAKES a NUMBER of Fibonacci terms to generate and RETURNS an array of the terms.
# fib(6) => [0,1,1,2,3,5]
# fib(100) => [0,1,..218922995834555169026]

### Version 1
# def fib
#   fibo_arr = [2, 3]
#   fibo_arr.each do |number|
#   new_number = number + fibo_arr[fibo_arr.index(number) - 1]
#   p new_number
#   end
# end

### Version 2
# def fib
#   fibo_arr = [2,3]
#   fibo_arr.each do |number|
#   new_number = fibo_arr.last + fibo_arr[-2]
#   p new_number
#   # fibo_arr << new_number
#   end
# end

### Final Version
def fib(num)
  fibo_arr = [0,1]
  num.times do
  fibo_arr << fibo_arr[-1] + fibo_arr[-2]
  end
  p fibo_arr[0..-3]
end

# fib(6)
# fib(100)

### Release 2: Sort an Array
# Pseudocode a sorting method that TAKES an ARRAY of integers and returns a sorted version of the ARRAY.
=begin

Even and Odd Sort Algorithm
  - input: Array A with unsorted integers and integers as n.
  - output: Array A with unordered even integers at beginning followed by unordered odd integers.

Given(A)
n = integers

  in A each n check
    if A[n + 1] == (n % 2 == 0)
      swap A[n + 1] and n
    end if
  end each

=end

