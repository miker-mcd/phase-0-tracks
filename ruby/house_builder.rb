# HOUSE MAKER

# Allow the user to create a house,
# the add rooms,
# then add items

# House can have up to 5 rooms
# Room can have an unlimited number of items

# BUSINESS LOGIC

# Idea to add on to the program
def parse_room_input(inputted_name)
  # clean up input
end

def add_room_to_house!(house, room_name)
  if house.keys.length == 5
    false
  else
    house[room_name] = []
    true
  end
end

def add_item_to_room!(house, room_name, item_name)
  house[room_name] << item_name
end

house = {}

# USER INTERFACE

def print_house(house)
  puts "-----------------"
  puts "Current house configuration:"
  house.keys.each_with_index do |room_name, index|
    puts "#{index} - #{room_name}: #{house[room_name]}"
  end
  puts "-----------------"
end

# Let the user add rooms
can_add_rooms = true

# Stop loop when rooms cannot be added
while can_add_rooms
  # Get a room name from the user
  puts "Type the name of a room to add (or type 'done'):"
  room_name = gets.chomp
  # If the user is done, stop loop
  break if room_name == 'done'
  # Otherwise, add the room to the house
  can_add_rooms = add_room_to_house!(house, room_name)
  if !can_add_rooms
    puts "Sorry, that's too many rooms!"
  end
  print_house(house)
end

# Let the user add items to rooms
# In an infinite loop:
loop do
  # Ask the user for the number of the room they want to add
  # items to
  puts "Enter the number of the room to add an item to (or type 'done':"
  inputted_idx = gets.chomp
  # If the user is done, break
  break if inputted_idx == 'done'
  # Otherwise, add the item to the room
  room_idx = inputted_idx.to_i
  puts "Enter the item to add:"
  items_to_add = gets.chomp
  add_item_to_room!(house, house.keys[room_idx], items_to_add)
  # Print the new house configuration
  print_house(house)
end

# TEST CODE

# rooms = ['Living room', 'bedroom', 'bathroom', 'kitchen', 'bedroom 2', 'bedroom 3']

# rooms.each do |room|
#   room_added = add_room_to_house!(house, room)
#   add_item_to_room!(house, room, 'cat') if room_added
# end

# print_house(house)

# How do we know when a method is dangerous or not? How do we know if a parameter will change outside of the method scope?

# Example

def change_bool(bool)
  bool = !bool
end

def change_num(x)
# only changes the data inside
  x += 1
  # p x would print 6, but would not change n outside of the scope. p n outside of the method would return 5.
end

def change_arr(arr)
  # modifying the array inside a method will modify it outside as well (inherently dangerous). Unless we make effort to not do that ex.
  # copy = arr.dup
  # copy << 1
  arr << 1
end

test_bool = true
n = 5
test_array = [2,3,4]

# p test_bool
# p n
# p test_array

# => 5
# => [2,3,4]

# change_num(n)
# change_arr(test_array)
# change_bool(test_bool) won't change value outside of method.

# p test_bool
# p n
# p test_array

# => 5
# => [2,3,4,1] modified