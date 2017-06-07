=begin
Alias Name Algorithm

- Receive full name from a user.
  # gets.chomp - string
- Swap the first and last name.
  # .split empty - array, .reverse?
- While iterating through each letter
  # .split(''), .map! block method with conditionals
  - If there is a vowel in the name (a, e, i, o, u), change to the next vowel in 'aeiou'
  # letter.include?("aeiou") --> either match to and (+1) advance within a e i o u array or build vowel conditionals in new method and pass in letter as argument to return new vowel ex. if letter == "a" then puts "e" ...
  - If there is a consonant in the name, change the letter to the next consonant in the alphabet. Ex. 'a' --> 'e' and 'd' --> 'f'.
  # letter.include?('bcdfghjklmnpqrstvwxyz') --> either match to and (+1) advance within consonant array or build consonant conditionals in new method and pass in letter as argument to return new consonant ex. if letter == "d" then puts "f" ...
  .next only for ASCII? does it take arguments?
=end

# Alias Name Algorithm

puts 'Please enter full name.'
real_name = gets.chomp

reverse_name = real_name.split.reverse!
# [last, first]

reverse_array = reverse_name.join(' ').split('')
# ['l', 'a', 's', 't', '', 'n', 'a', 'm', 'e']

p reverse_array