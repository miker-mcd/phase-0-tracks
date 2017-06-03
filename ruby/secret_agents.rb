=begin
encrypt method
- while index is less than the length of the string
  - if string contains a space
    - leave unchanged and move to next letter
  - Otherwise:
  - Advance each letter of the string one letter forward. Ex. input = "abc" output = "bcd"
=end

def encrypt_str(str)

index = 0

while index < str.length
  # letter = str[index].delete(" ")
  letter = str[index].next
  if letter == "aa"
    letter = "a"
  end
  p letter
  index += 1
  end
end

# puts encrypt_str("zed")

=begin
decrypt method
- while index is less than the length of the string
  - if string contains a space
    - leave unchanged and move to next letter
  - Otherwise:
  - Go backward one letter for each letter of the string. Ex. input = "abc" output = "zab"
=end

def decrypt_str(word)

# word = "secret"
index = 0
alphabet = "abcdefghijklmnopqrstuvwxyz"

while index < word.length
  letter_index = alphabet.index(word[index])
  previous_letter = letter_index - 1
  decrypt_letter = alphabet[previous_letter]
  p decrypt_letter
  index += 1
  end
end

# puts decrypt_str("afe")