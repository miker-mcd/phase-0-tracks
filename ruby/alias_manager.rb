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
# [Last, First]

reverse_string = reverse_name.join(' ')
# 'Last first'

reverse_array = reverse_string.split('')
# ['L', 'a', 's', 't', '', 'F', 'i', 'r','s','t']

# Next Vowel Method
def next_vowel(vowel)
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
  vowel = 'o'
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

# next_consonant(letter)
next_vowel(letter)
end

# p letter

# reverse_array.map! { |letter| letter.next }

p reverse_array