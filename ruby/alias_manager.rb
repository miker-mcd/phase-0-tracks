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

def alias_method(letters_array)

letters_array.map! do |letter|

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
letters_array.join('')
end

######## User interface

real_name = ''
alias_list = {}

until real_name == 'quit'

puts 'Please enter full name or type \'quit\' to continue.'
real_name = gets.chomp

if real_name == 'quit'
  puts "Exit program"
elsif real_name == ''
  puts "A name was not provided."
  break
else

reverse_name = real_name.split.reverse!
# ['Last', 'First'] <-- array

reverse_string = reverse_name.join(' ')
# 'Last first' <-- string

reverse_array = reverse_string.split('')
# ['L','a','s','t','','F','i','r','s','t']

alias_name = alias_method(reverse_array)

puts alias_name

alias_list[real_name] = alias_name

end
p alias_list

end

alias_list.each do |real_name, alias_name|
  puts "#{alias_name} is actually #{real_name}"
  end