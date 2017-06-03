=begin
encrypt method
- while index is less than the length of the string
  - Advance each letter of the string one letter forward. Ex. input = "abc" output = "bcd"
- if string contains a space
    - leave unchanged and move to next letter
  - Otherwise:
=end

def encrypt(word)

index = 0
letter = ""

while index < word.length
  # letter = word[index].delete(" ")
  letter += word[index].next
  if letter == "aa"
    letter = "a"
  end
  index += 1
  end
  p letter
end

encrypt("swordfish")

=begin
decrypt method
- while index is less than the length of the string
  - if string contains a space
    - leave unchanged and move to next letter
  - Otherwise:
  - Go backward one letter for each letter of the string. Ex. input = "abc" output = "zab"
=end

def decrypt(word)

index = 0
decrypt_letter = ""
# word = ""
alphabet = "abcdefghijklmnopqrstuvwxyz"

while index < word.length
  letter_index = alphabet.index(word[index])
  previous_letter = letter_index - 1
  decrypt_letter += alphabet[previous_letter]
  index += 1
  end
  p decrypt_letter
end

decrypt("txpsegjti")

decrypt(encrypt("swordfish"))