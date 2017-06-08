=begin
Alias Name Algorithm

- While user provides a name when prompted:
  # gets.chomp - string
  - Swap the first and last name.
  # .split empty - array, .reverse?
  - While iterating through each letter
   # .split(''), .map! block method with  conditionals
    - If there is a vowel in the name (a, e,  i, o, u), change to the next vowel in  'aeiou'
   # letter.include?("aeiou") --> either  match to and (+1) advance within a e i o u array or build vowel conditionals in new method and pass in letter as argument to return new vowel ex. if letter == "a" then  puts "e" ...
   - If there is a consonant in the name,  change the letter to the next consonant in  the alphabet. Ex. 'a' --> 'e' and 'd' -->  'f'.
   # letter.include?('bcdfghjklmnpqrstvwxyz')  --> either match to and (+1) advance  within consonant array or build consonant  conditionals in new method and pass in  letter as argument to return new consonant  ex. if letter == "d" then puts "f" ...
   .next only for ASCII? does it take  arguments?
  - If user types 'quit', then exit the program.
Otherwise:
  - If user hits enter or input is nil, then continue program.
=end

puts 'Welcome to the Alias Manager'

real_name = ''

until real_name == 'quit'

puts 'Please enter full name or type \'quit\' to continue.'
real_name = gets.chomp

if real_name == 'quit'
  puts "Thank you for using Alias Manager."
else

reverse_name = real_name.split.reverse!
# ['Last', 'First'] <-- array

reverse_string = reverse_name.join(' ')
# 'Last first' <-- string

reverse_array = reverse_string.split('')
# ['L', 'a', 's', 't', '', 'F', 'i', 'r','s','t'] <-- array

# Next Vowel Method
def next_vowel(vowel)

if vowel == vowel.upcase
  vowel = vowel.swapcase
end

case
when vowel == 'a'
  vowel = 'e'
when vowel == 'e'
  vowel = 'i'
when vowel == 'i'
  vowel = 'o'
when vowel == 'o'
  vowel = 'u'
when vowel == 'u'
  vowel = 'a'
when vowel == 'd'
  vowel = 'f'
when vowel == 'h'
  vowel = 'j'
when vowel == 'n'
  vowel = 'p'
when vowel == 't'
  vowel = 'v'
when vowel == 'z'
  vowel = 'b'
else
  vowel = vowel.next
end

p vowel
end

# next_vowel('a')
# next_vowel('u')

# Next Consonant Method
def next_consonant(consonant)
  consonants = 'bcdfghjklmnpqrstvwxyz'
  # if consonant == 'z' <-- edge case!!!
  #   consonant = 'b'
  #   p consonant
  if consonants.include?(consonant)
  consonant_index = consonants.index(consonant) + 1
  new_consonant = consonants[consonant_index]
end
  p new_consonant
end

# next_consonant('t')
# next_consonant('d')

reverse_array.map! do |letter|

# if letter == letter.upcase
#   letter = letter.swapcase
# end

next_vowel(letter)
end

# p reverse_array

alias_name = reverse_array.join('')

puts "Your alias name is #{alias_name}"

end
end