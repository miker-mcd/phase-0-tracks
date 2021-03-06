# Method to create a list
# input: A line of items separated by spaces (string) (example: "carrots apples cereal pizza")
# steps:
  # Create an empty container object.
  # Separate a given list of items into individual items.
  # For EACH individual item
    # Add the item to the container.
    # Set the default quantity of the item to one.
  # END EACH
  # Display the list to the user [can you use one of your other methods here?]
# output: A list of grocery items (hash).

def create_list(items)
  grocery_items = {}
  items.split(" ").each do |item|
    grocery_items[item] = 1 #Refactor?
  end
  pretty_list(grocery_items)
  return grocery_items
end

# Method to add an item to a list
# input: list (hash), item name (string, and optional quantity (integer)
# steps:
  # Add one given item and optional quantity of that item to the existing grocery list.
# output: An updated version of the grocery list with added items listed (hash).

def add_item(grocery_list, item, qty)
  grocery_list[item] = qty
  p grocery_list
end

# Method to remove an item from the list
# input: A list (hash) and item name (string) to be removed.
# steps:
  # Remove one given item from the grocery list.
# output: An updated version of the grocery list without the item that was removed (hash.

def remove_item(grocery_list, item)
  grocery_list.delete(item)
  p grocery_list
end

# Method to update the quantity of an item
# input: A list (hash), an item name (string) and quantity (integer) to be updated.
# steps:
  # Change one given item's quantity.
# output: An updated version of the grocery list with an item's updated quantity.

def update_qty(grocery_list, item, qty)
  grocery_list[item] = qty
  p grocery_list
end

# Method to print a list and make it look pretty
# input: The updated grocery list (hash)
# steps:
  # Display the grocery list items on separate lines with their corresponding quantities next to the item.
# output: A pretty readable version of the grocery list (individual strings of the items).

def pretty_list(grocery_list)
  puts "**************"
  grocery_list.each do |item, qty|
    puts "#{item} qty:#{qty}"
  end
  puts "**************"
end

# # TEST CODE

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

# # REFLECTION

# I learned that pseudocode is a very important tool that can help to map out the logic of your program before you actually start to code. It acts as a guide that you can reference to and update as you implement the logic you've written out into the code. I now understand how it vital it is to not feel overwhelmed by a problem because it helps you to break the problem down into simple steps.

# My pair and I discussed that because the grocery list of items has a corresponding quantity, a hash makes it easier to understand that relationship especially when displaying the list to the user. An array would be easier to work with and set up, but wouldn't be readable to the user.

# A method always returns a value of the last evaluated line in the method.

# You can pass in objects like integers, strings and other methods as arguments in methods.

# Information can be passed between methods by calling a method as an argument in a different method, where the return value of the method as argument can be used within the method definition.

# Pseudocode, initial solution and refactoring were definitely solidified in this challenge. I really didn't understand how to pseudocode and what the real purpose it had besides explaining the code in a simple format. I also learned more about the efficiency of passing information between methods and how it can be used to make programs more concise.