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
  puts alpha[index] = alpha[index].next
  index += 1
  end

encrypt method
- while index is less than the length of the string
  - if string contains a space
    - leave unchanged and move to next letter
  - Otherwise:
  - Advance each letter of the string one letter forward. Ex. input = "abc" output = "bcd"