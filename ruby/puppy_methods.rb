class Puppy

  def fetch(toy)
    puts "I brought back the #{toy}!"
    toy
  end

  def speak(int)
    p "Woof!" * int
  end

  def roll_over
    p "Rolls over"
  end

  def dog_years(int)
    puts "#{int * 7} dog years"
  end

  def plays_dead(int)
    p "Bang!" * int
    puts "I'm dead"
  end

  def initialize
    p "Initializing new puppy instance..."
  end

end

# Puppy.new.fetch("ball")
# Puppy.new.speak(3)
# Puppy.new.roll_over
# Puppy.new.dog_years(5)
# Puppy.new.plays_dead(3)

class Clown

  def juggles(int)
    "I'm juggling #{int} balls!"
  end

  def joke(str)
    puts "Why did #{str} cross the road!?"
    puts "Cuz the light was green!"
  end

  def initialize
    # p "Initializing new clown instance..."
  end

end

Clown.new.juggles(3)
Clown.new.joke("Gabby")

numbers = *(1..50)

array = []

numbers.each do |x|
  array << Clown.new.juggles(x)
end

p array