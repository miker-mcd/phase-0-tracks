# # BUSINESS CODE

class WordGame
  attr_reader :secret_array

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
  # @guesses = ["a","b"]
  @guesses[0...-1].each do |letter|
    if @guesses[-1] == letter
      return true
    # else
    #   return false
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
# Output: True or False

def compare_letters
  # @secret_array = ["t","a","b","l","e"]
  # @guesses = ["d","v","c","a"]
  @secret_array.each do |letter|
    if @guesses[-1] == letter
      return true
    # else
    #   return false
    end
  end
end

end

# TEST CODE
puts "Enter a secret word"
input = gets.chomp
game = WordGame.new(input)
p game.split_secret

hidden_word = input.chars.each { |letter| letter.replace "_" }.join("")

puts "#{hidden_word}"

# FIRST LETTER
puts "Guess a letter"
guess = gets.chomp
p game.guess_letters(guess)
  if game.compare_letters != true
    puts "Wrong, guess again" # Guess count guesses remaining.
  else
    puts "Correct!"
    correct_letter_index = input.chars.each_index.select {|index| input[index] == guess }
    correct_letter_index.each {|index| hidden_word[index] = guess}
    puts "#{hidden_word}"
  end

# GUESS LETTERS

count = 0
while count < (game.secret_array.length - 1)
# (game.secret_array.length - 1).times do
  puts "Guess a letter"
  guess = gets.chomp
  p game.guess_letters(guess)
    if game.same_guess == true
      puts "You've already guessed #{guess}!"
      # if game.compare_letters
      #   # next
      #   hidden_word[input.reverse.index(guess)] = guess
      #   puts "#{input}"
      # end
      count -= 1
      # (game.secret_array.length + 1)
    end
    if game.compare_letters != true
      puts "Wrong, guess again"
    else
      puts "Correct!"
      correct_letter_index = input.chars.each_index.select {|index| input[index] == guess }
      correct_letter_index.each {|index| hidden_word[index] = guess}
      puts "#{hidden_word}"
      # hidden_word[input.index(guess)] = guess
      # puts "#{hidden_word}"
    end
  count += 1
end

if hidden_word == input
  puts "You win!"
else
  "You lose!"
end

# # USER INTERFACE
# puts "Enter a secret word"
# input = gets.chomp
# game = WordGame.new(input)
# p game.split_secret