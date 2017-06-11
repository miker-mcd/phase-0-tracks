# Robot Translator

# If a letter is capitalized and it's in the first half of the alphabet, it becomes 'bloop'.

# Otherwise, if a letter is capitalized or it's the letter 'e', it becomes 'buzz'.

# If it's not a letter at all, it becomes 'boing'.

# Otherwise, it becomes 'beep'.

def translate_char(char)
  alphabet = 'abcdefghijklmnopqrstuvwxyz'
  halfway = alphabet.length / 2
  is_capitalized = (char.upcase == char)
  index_of_char = alphabet.index(char.downcase)

  if index_of_char == nil
    'boing'
  elsif is_capitalized && index_of_char < halfway
    'bloop'
  elsif is_capitalized || char == 'e'
    'buzz'
  else
    'beep'
  end
end

def translate_phrase(phrase)
  char_index = 0
  translated_response = ''
  while char_index < phrase.length
    translated_response << translate_char(phrase[char_index])
    char_index += 1
  end
  translated_response
end

loop do
  puts 'Enter a phrase to translate (or type \'q\' for quit):'
  inputted_phrase = gets.chomp
  break if inputted_phrase == 'q'
  puts translate_phrase(inputted_phrase)
end
