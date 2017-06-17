# # BUSINESS CODE

class WordGame

  def initialize(word)
    @secret_word = word
    @guesses = []
    @secret_array = []
  end

# Secret Word Method
# Input: Word (String)
# Create a counter and set it to zero
# Create an empty container object
# WHILE counter is less than length of the word
  # Push letter at the counter index to the container
  # Add one to the counter
# ENDWHILE
# Output: Container (Array)

  def split_secret
    counter = 0
  while counter < @secret_word.length
    @secret_array << @secret_word[counter]
  counter += 1
  end
  @secret_array
  end

# Player 2 Guess Letter Method
# Input: letter (String)
# Create an empty container object
# Push the letter to the container
  # Add one to the counter
  # Subtract one from the counter
# Output: Container (Array)

def guess_letter(letter)
  @guesses << letter
  @guesses
end

# Same Letter Method
# Input: None
# for EACH letter in the guesses container
  # IF the last guess letter is the same as a previous letter in the guesses container, it is a match (TRUE)
  # ELSE the last letter doesn't match (FALSE)
  # ENDIF
# ENDEACH
# Output: The matched letter (String)

def same_guess
  @guesses = ["a","d","b","c","a"]
  @guesses.each do |letter|
    if @guesses[-1] == letter
      return @guesses[-1]
    end
  end
end

# Compare Guess Letter vs. Secret Word Letters
# Input: None
# for EACH letter in the secret letters container
  # IF the last letter in the second container is the same as any letter in the first container, it is a match (TRUE)
  # ELSE the last letter doesn't match (FALSE)
  # ENDIF
# ENDEACH
# Output: The matched letter (string)

def compare_letters
  @secret_array = ["p","i","z","z","a"]
  @guesses = ["d","b","c","a"]
  @secret_array.each do |letter|
    if @guesses[-1] == letter
      return @guesses[-1]
    end
  end
end

end

# # USER INTERFACE

# puts "Enter a secret word"
# input = gets.chomp
# game = WordGame.new(input)
# p game.split_secret

# counter = 0
# while counter < game.secret_array.length
#   puts "Guess a letter"
#   guess = gets.chomp
#   p game.guess_letter(guess)
#   counter += 1
# end

# p game.compare_letters
