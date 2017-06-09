arr = [42, 89, 23, 1]
# index = 0
# p search_array(arr, 1)
# p search_array(arr, 24)
# don't use built-in array methods like .index

def search_array(arr, x)

  arr.each do |number|
    if x == number

      # p arr.index(number)
end
end
end

# search_array(arr, 89)

def search_array(arr, x)
count = 0
while count < arr.length
  if x != arr[count]
    p 'nil'
    break
  elsif x == arr[count]
    p count
  end
count += 1
end
end

search_array(arr, 1)
search_array(arr, 24)