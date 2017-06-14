# Method to create a list
# input: string of items separated by spaces (example: "carrots apples cereal pizza")
# steps:
  # Create a method that takes an item and quantity as arguments.
  # Assign the item as the key and quantity as the value into the empty grocery list hash.
  # Create an empty hash for the grocery list.
  # Iterate through the list of items and add to the grocery list hash.
  # set default quantity
  # print the list to the console [can you use one of your other methods here?]
# output: [what data type goes here, array or hash?]

def create_list(items)
  grocery_items = {}
  items.split(" ").each do |item|
    grocery_items[item] = 1
  end
  # p grocery_items
  pretty_list(grocery_items)
  return grocery_items
end

# Method to add an item to a list
# input: list, item name, and optional quantity
# steps:
# Create a method that takes an inputted item and optional quantity and adds to grocery list hash.
# output:
# An updated version of the grocery list with added items listed.

def add_item(grocery_list, item, qty)
  grocery_list[item] = qty
  p grocery_list
end

# Method to remove an item from the list
# input: The hash and item name to be removed.
# steps:
# Use built-in method delete or delete_if to remove item from the list.
# output:
# An updated version of the grocery list without items that were removed.

def remove_item(grocery_list, item)
  grocery_list.delete(item)
  p grocery_list
end

# Method to update the quantity of an item
# input: The hash item and quantity to be updated.
# steps:
# Pass in a value to change the item quantity.
# output:
# An updated version of the grocery list with a updated key value.

def update_qty(grocery_list, item, qty)
  grocery_list[item] = qty
  p grocery_list
end

# Method to print a list and make it look pretty
# input:
# The updated grocery list.
# steps:
# Print hash: item_name : Qty
# output:
# A pretty readable version of the grocery list.

def pretty_list(grocery_list)
  puts "**************"
  grocery_list.each do |item, qty|
    puts "#{item} qty:#{qty}"
  end
  puts "**************"
end

# TEST CODE

# Create a new list
grocery_list = create_list("carrots apples cereal pizza")

# Add the following items to your list
add_item(grocery_list, "Lemonade", 2)
add_item(grocery_list, "Tomatoes", 3)
add_item(grocery_list, "Onions", 1)
add_item(grocery_list, "Ice Cream", 4)

# Remove the Lemonade from your list
remove_item(grocery_list, "Lemonade")

# Update the Ice Cream quantity to 1
update_qty(grocery_list, "Ice Cream", 1)

# Print out your list
pretty_list(grocery_list)