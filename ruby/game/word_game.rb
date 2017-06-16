# # PSEUDOCODE

# IF the last letter in the second container is the same as any letter in the first container, it is a match (TRUE)
# DISPLAY letter
# ELSE the last letter doesn't match (FALSE)

# # BUSINESS CODE

class WordGame

  def initialize(word)
    @secret_word = word
  end

# Secret Word Method
# Create a counter and set it to zero
# Create an empty container object
# WHILE counter is less than length of the word
  # Push letter at the counter index to the container
  # Add one to the counter
# ENDWHILE
# RETURN container

  def split_secret
    counter = 0
    secret_array = []
  while counter < @secret_word.length
    secret_array << @secret_word[counter]
  counter += 1
  end
  secret_array
  end

# Player 2 Guess Letter Method
# Create an empty container object
# Create a counter and set it to zero
# WHILE counter is less than length of the first container AND letter matches a previous letter in the same container
  # Push the letter of the counter index to the container
  # Add one to the counter
  # IF the letter is the same as a previous letter in the same container
    # Subtract one from the counter
  # ENDIF
# ENDWHILE
# RETURN container

def guess_letter(letter)
  guesses = []
  guesses << letter
  guesses
end

end