=begin
Alias Name Algorithm

- While user provides a name when prompted:
  - Swap the first and last name.
  - While iterating through each letter
    - If there is a vowel in the name (a, e, i, o, u), change to the next vowel in  'aeiou'
   - If there is a consonant in the name,  change the letter to the next consonant in  the alphabet. Ex. 'a' --> 'e' and 'd' -->  'f'.
  - If user types 'quit', then exit the program.
Otherwise:
  - If user hits enter or input is nil, then continue program.
=end

# Create a method that changes a vowel to the next vowel and a consonant to the next consonant and returns the letters joined together as one string.
def alias_method(array_of_letters)
  array_of_letters.map! do |letter|
    case
      when letter == 'a'
        letter = 'e'
      when letter == 'e'
        letter = 'i'
      when letter == 'i'
        letter = 'o'
      when letter == 'o'
        letter = 'u'
      when letter == 'u'
        letter = 'a'
      when letter == 'd'
        letter = 'f'
      when letter == 'h'
        letter = 'j'
      when letter == 'n'
        letter = 'p'
      when letter == 't'
        letter = 'v'
      when letter == 'z'
        letter = 'b'
      when letter == 'Z'
        letter = 'A'
      else
        letter = letter.next
      end
    end
  array_of_letters.join('')
end

# Set up an empty string for a name.
# Set up an empty hash to store the real name and alias name pairs.

real_name = ''
alias_list = {}

# Set up a loop to receive a name as input until the user types 'quit' to end the program.
until real_name == 'quit'

# Prompt user for a name.
puts 'Please enter full name or type \'quit\' to continue.'
real_name = gets.chomp

# If input is 'quit' or '' exit program.
  if real_name == 'quit'
   p "Exit program"
  elsif real_name == ''
   p "A name was not provided."
   break
  else

# Create array of letters of name after reversing.
reverse_array = real_name.split.reverse!
reverse_name = reverse_array.join(' ')
reverse_letters = reverse_name.split('')

# Pass in reverse letters of name in the alias_method and assign return as the alias name.
alias_name = alias_method(reverse_letters)

# Create a key value pair of the real name and alias name to be added to the alias list hash.
alias_list[real_name] = alias_name

  end
end

# Iterate through each real name and alias name pair in the alias list hash and print the pair to the user.
alias_list.each do |real_name, alias_name|
  puts "#{alias_name} is actually #{real_name}"
  end