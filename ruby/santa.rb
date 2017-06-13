class Santa

  attr_reader :age, :ethnicity
  attr_accessor :gender

  def speak
    puts "Ho, ho, ho! Haaaappy holidays!"
  end

  def eat_milk_and_cookies(cookie)
    puts "That was a good #{cookie}!"
  end

  def initialize(gender, ethnicity, age)
    @gender = gender
    @ethnicity = ethnicity
    # @reindeer_ranking = ["Rudolph","Dasher","Dancer","Prancer","Vixen","Comet","Cupid","Donner","Blitzen"]
    @age = age
    # puts "Initializing Santa instance..."
    # puts "New Santa is #{@gender} and #{@ethnicity}"
  end

  def celebrate_birthday
    @age + 1
  end

  def get_mad_at(reindeer_name)
    @reindeer_ranking << @reindeer_ranking.slice!(@reindeer_ranking.index(reindeer_name))
  end

end

# Test Code

# kris_kringle = Santa.new("non-conforming","Canadian")
# good_grinch = Santa.new("unknown","Whovillain")
# krampus = Santa.new("male","German")
# kris_kringle.speak
# kris_kringle.eat_milk_and_cookies("snickerdoodle")
# puts krampus.get_mad_at("Dasher")
# puts kris_kringle.age
# puts good_grinch.gender
# puts krampus.ethnicity

# Build Santas Program

# BUSINESS CODE

# Create a Santa with a random gender and random ethnicity
def santa_maker(num)
  santas = []
  example_genders = ["agender", "female", "bigender", "male", "female", "gender fluid", "non-conforming"]
  example_ethnicities = ["black", "Latino", "white", "Japanese-African", "prefer not to say", "Mystical Creature (unicorn)", "multi-ethnic"]

# Set each new Santa age to random number between 0 and 140
  age = (0..140).to_a
  num.times do |i|
  santas << Santa.new(example_genders.sample, example_ethnicities.sample, age.sample)
  end

# print out attributes of each Santa
  santas.each do |santa|
    puts "#{santa} is proudly #{santa.gender}, #{santa.ethnicity} and #{santa.age}!"
  end
end

# DRIVER CODE

# Ask user how many Santas to create.
puts "How many Santas would you like to create?"
input = gets.chomp.to_i

# Print list of Santas with random attributes
puts "Here are the Santas!"
santa_maker(input)

# Exit greeting
puts "Thank you for using the Santacon Simulator, good bye!"