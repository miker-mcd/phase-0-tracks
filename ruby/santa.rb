class Santa

  def speak
    puts "Ho, ho, ho! Haaaappy holidays!"
  end

  def eat_milk_and_cookies(cookie)
    puts "That was a good #{cookie}!"
  end

  def initialize(gender, ethnicity)
    @gender = gender
    @ethnicity = ethnicity
    @reindeer_ranking = ["Rudolph","Dasher","Dancer","Prancer","Vixen","Comet","Cupid","Donner","Blitzen"]
    @age = 0
    puts "Initializing Santa instance..."
    puts "New Santa is #{@gender} and #{@ethnicity}"
  end

  def celebrate_birthday
    @age + 1
  end

  def get_mad_at(reindeer_name)
    @reindeer_ranking << @reindeer_ranking.slice!(@reindeer_ranking.index(reindeer_name))
  end

  # Getter Methods
  def gender
    @gender
  end

  def age
    @age
  end

  def ethnicity
    @ethnicity
  end

  # Setter Methods
  def gender=(new_gender)
    @gender = new_gender
  end

end

# Driver Code

kris_kringle = Santa.new("non-conforming","Canadian")
good_grinch = Santa.new("unknown","Whovillain")
krampus = Santa.new("male","German")
kris_kringle.speak
kris_kringle.eat_milk_and_cookies("snickerdoodle")
puts krampus.get_mad_at("Dasher")
puts kris_kringle.age
puts good_grinch.gender
puts krampus.ethnicity

# santas = []
# example_genders = ["agender", "female", "bigender", "male", "female", "gender fluid", "N/A"]
# example_ethnicities = ["black", "Latino", "white", "Japanese-African", "prefer not to say", "Mystical Creature (unicorn)", "N/A"]
# example_genders.length.times do |i|
#   santas << Santa.new(example_genders[i], example_ethnicities[i])
# end
# p santas