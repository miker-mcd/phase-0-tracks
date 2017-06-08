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

# puts 'Please enter full name.'
# real_name = gets.chomp

# reverse_name = real_name.split.reverse!
# # [last, first]

# reverse_string = reverse_name.join(' ')
# # 'Last first'

# Next Vowel
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
end
p vowel
end

next_vowel('u')

# Next Consonant
def next_consonant(consonant)
  consonants = 'bcdfghjklmnpqrstvwxyz'
  consonant_index = consonants.index(consonant) + 1
  new_consonant = consonants[consonant_index]
  p new_consonant
end

next_consonant("t")

# reverse_array.map! do |letter|

# case
# when letter == 'a'
#   letter = 'e'
# when letter == 'e'
#   letter = 'i'
# when letter == 'i'
#   letter = 'o'
# when letter == 'o'
#   letter = 'u'
# when letter == 'u'
#   letter = 'a'
# end

# p letter
# end

# reverse_array.map! { |letter| letter.next }

# p reverse_array