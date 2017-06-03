=begin

encrypt method
- while index is less than the length of the string
  - if string contains a space
    - leave unchanged and move to next letter
  - Otherwise:
  - Advance each letter of the string one letter forward. Ex. input = "abc" output = "bcd"

alpha = "abc"
index = 0

while index < alpha.length
  alpha[index] = alpha[index].delete(" ")
  alpha[index] = alpha[index].next
  p alpha[index]
  index += 1
  end

decrypt method
- while index is less than the length of the string
  - if string contains a space
    - leave unchanged and move to next letter
  - Otherwise:
  - Go backward one letter for each letter of the string. Ex. input = "abc" output = "zab"
=end

alpha = gets.chomp
index = 0

while index < alpha.length
  letter = alphabet.index(alpha[i])
  previous_letter = letter - 1
  decrypt_letter = alphabet[previous_letter]
  p decrypt_letter
  index += 1
  end
