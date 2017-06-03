=begin
encrypt method
- while index is less than the length of the string
  - Advance each letter of the string one letter forward. Ex. input = "abc" output = "bcd"
    - if string contains a space
      - leave unchanged and move to next letter
    - if letter is "aa", then return only "a"
=end

def encrypt(word)

index = 0
# declare empty string we will add to
letter = ""
# loop over the string's letters
while index < word.length
  # letter = word[index].delete(" ")
  # use "+=" to combine returned letters(as individual strings) on one line ex. word = "hi" word += "there" output" "hithere"
  letter += word[index].next
  # sub "aa" for "a"
  if letter == "aa"
    letter = "a"
  end
  index += 1
  end
  p letter
end

# encrypt("swordfish")

=begin
decrypt method
- while index is less than the length of the string
  - Go backward one letter for each letter of the string. Ex. input = "abc" output = "zab"
    - if string contains a space
      - leave unchanged and move to next letter
=end

def decrypt(word)

index = 0
# declare empty string we will add to
decrypt_letter = ""
# declare alphabet index to compare to
alphabet = "abcdefghijklmnopqrstuvwxyz"
# loop over letters of string
while index < word.length
  # word[index] to get letter as a string. alphabet.index to get alphabet index of that matched letter (returns an integer)
  letter_index = alphabet.index(word[index])
  # Use letter_index result and goes back one
  previous_letter = letter_index - 1
  # Use previous_letter to get matching position (integer) to corresponding letter in the alphabet. Combines each returned letter (as individual strings) on one line
  decrypt_letter += alphabet[previous_letter]
  index += 1
  end
  p decrypt_letter
end

# decrypt("txpsegjti")

# decrypt(encrypt("swordfish"))

# The nested method call works because the encrypt method takes a string as a parameter and returns a string as the output. The resulting string from the encrypt method can be used as the parameter for the decrypt method to return a string as the output. By order of operations within this call, the encrypt method would perform first, then the decrypt method would perform to return a final string.

# DRIVER CODE

# Ask a secret agent if they would like to encrypt or decrypt a password
puts "Do you want to encrypt or decrypt a password?"
answer = gets.chomp

# Ask for the password
puts "Please enter a password to use."
password = gets.chomp

# Encrypt or decrypt given password
if answer == "encrypt"
  encrypt(password)
elsif answer == "decrypt"
  decrypt(password)
end

# End program
puts "Password provided, goodbye."