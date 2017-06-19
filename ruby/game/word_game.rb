# # BUSINESS CODE

class WordGame
  attr_reader :secret_array

  def initialize(word)
    @secret_word = word
    @guesses = []
    @secret_array = []
  end

# I would refactor this method and use built-in methods in the driver code to achieve the same result.
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
# Output: Container (Array)

def guess_letters(letter)
  @guesses << letter
  @guesses
end

# Same Letter Method
# Input: None
# for EACH previous letter in the guesses container
  # IF the last guess letter is the same as a previous letter in the guesses container, it is a match (TRUE)
  # ELSE the last letter doesn't match (FALSE)
  # ENDIF
# ENDEACH
# Output: True or False

def same_guess
  @guesses[0...-1].each do |letter|
    if @guesses[-1] == letter
      return true
    # else
    #   return false
    # I couldn't figure out why this method would not return false if the last letter did not match.
    end
  end
end

# Compare Guess Letter vs. Secret Word Letters
# Input: None
# for EACH letter in the secret letters container
  # IF the last letter in the guesses container is the same as any letter in the secret word container, it is a match (TRUE)
  # ELSE the last letter doesn't match (FALSE)
  # ENDIF
# ENDEACH
# Output: True or False

def compare_letters
  @secret_array.each do |letter|
    if @guesses[-1] == letter
      return true
    # else
    #   return false
    # Again, I could not figure out why this method did not return false if the letter did not match any letter in the secret word array.
    end
  end
end

end

# DRIVER CODE

# Ask the first user to enter a word for a second user to guess.
puts "Let's start the game!"
puts "Enter a secret word"
input = gets.chomp
game = WordGame.new(input)
game.split_secret

# Display the hidden word to the second user.
hidden_word = input.chars.each { |letter| letter.replace "_" }.join("")

puts "#{hidden_word}"

# Start the game and ask the second user to guess a letter.
puts "Player 2: Guess a letter."
guess = gets.chomp
game.guess_letters(guess)
  if game.compare_letters != true
    puts "Wrong guess!"
    puts "#{hidden_word}"
  else
    puts "Correct!"
    correct_letter_index = input.chars.each_index.select {|index| input[index] == guess }
    correct_letter_index.each {|index| hidden_word[index] = guess}
    puts "#{hidden_word}"
  end

# Ask the second user to guess a letter repeatedly until they win or lose.
count = 0
while count < (game.secret_array.length - 1) && hidden_word != input
  puts "Guess a letter"
  guess = gets.chomp
  game.guess_letters(guess)
    if game.same_guess == true
      puts "You've already guessed #{guess}! This guess doesn't count."
      count -= 1
    end
    if game.compare_letters != true
      puts "Wrong guess!"
      puts "#{hidden_word}"
    else
      puts "Correct!"
      correct_letter_index = input.chars.each_index.select {|index| input[index] == guess }
      correct_letter_index.each {|index| hidden_word[index] = guess}
      puts "#{hidden_word}"
    end
  count += 1
  # Display a congratulatory message if they win.
    if hidden_word == input
      puts "You win!"
    end
end

# Display a taunting message if they lose.
# I was not able to figure out why I couldn't create one conditional to handle both a win and lose message.
if hidden_word != input
  puts "Sorry, you lose!"
end