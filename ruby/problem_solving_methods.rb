### Release 0 Simple Search

# index = 0
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

p search_array(arr, 1)
p search_array(arr, 24)

# Why do both declarations return: 3, nil, nil, ' '? - p returns nil, but second p return ' '.

### Release 1 Calculate Fibonacci Numbers

