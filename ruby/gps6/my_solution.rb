# Virus Predictor

# I worked on this challenge by myself, with: Michael].
# We spent 2.5 hours on this challenge.

# EXPLANATION OF require_relative
#require_relative compliments the built in method require.allows you to load/import an outside file still in the directory to have access to the data.
#differs from require does not offer a good solution for loading files within projects code. might be good to access test data( not intended for outside use)
require_relative 'state_data'

class VirusPredictor
  attr_accessor :population_density, :state, :population

# creates an instance involving three arguments:state of origin, pop density, and population.
  def initialize(state_of_origin, population_density, population)
    @state = state_of_origin
    @population = population
    @population_density = population_density
  end

  private

#method that executes the other called methods.
  def virus_effects
    predicted_deaths(population_density, population, state)
    speed_of_spread(population_density, state)
  end

 # private

# method that takes three arguments. calculates the number of deaths by assessing population subsequently/based on the population density range
  def predicted_deaths(population_density, population, state)
    # predicted deaths is solely based on population density
    if population_density >= 200
      number_of_deaths = (population * 0.4).floor
    elsif population_density >= 150
      number_of_deaths = (population * 0.3).floor
    elsif population_density >= 100
      number_of_deaths = (population * 0.2).floor
    elsif population_density >= 50
      number_of_deaths = (population * 0.1).floor
    else
      number_of_deaths = (population * 0.05).floor
  end

   print "#{state} will lose #{number_of_deaths} people in this outbreak"

 end

# method that takes in two arguments and evaluates how quickly the disease will spread based off population density.
  def speed_of_spread(population_density, state)
    # We are still perfecting our formula here. The speed is also affected
    # by additional factors we haven't added into this functionality.
    speed = 0.0

    if population_density >= 200
      speed += 0.5
    elsif population_density >= 150
      speed += 1
    elsif population_density >= 100
      speed += 1.5
    elsif population_density >= 50
      speed += 2
    else
      speed += 2.5
    end

   puts " and will spread across the state in #{speed} months.\n\n"

 end

end

#=======================================================================

# DRIVER CODE
 # initialize VirusPredictor for each state


alabama = VirusPredictor.new("Alabama", STATE_DATA["Alabama"][:population_density], STATE_DATA["Alabama"][:population])
alabama.virus_effects

jersey = VirusPredictor.new("New Jersey", STATE_DATA["New Jersey"][:population_density], STATE_DATA["New Jersey"][:population])
jersey.virus_effects

california = VirusPredictor.new("California", STATE_DATA["California"][:population_density], STATE_DATA["California"][:population])
california.virus_effects

alaska = VirusPredictor.new("Alaska", STATE_DATA["Alaska"][:population_density], STATE_DATA["Alaska"][:population])
alaska.virus_effects

# Creates a report for all 50 states
STATE_DATA.each do |state, info|
  current_state = VirusPredictor.new(state, info[:population_density], info[:population])
  current_state.virus_effects
  # p info[:population_density]
  # p state
  # p info
end

##################
# REFLECTION
# The two different hash syntaxes shown were the assigning of key value pairs. One style of assigning is using the hash rocket with "state" => hash and the other was displayed in the hash as value of state with pop_density: number. Both styles written accomplish the same purpose of assigning a key and value.

# require_relative is a command that allows a class to refer to data in a file that's relative to the current directory. It compliments require in the sense that it looks directly to the current directory to locate the file. relative requires a the entire file path to locate the file that is being referred, especially if it is outside the current directory.

# There are some built-in methods to iterate through a hash including #each, #each_par, #each_key, #each_value

# What stood out to us was the syntax of the variables using the @ symbol. We realized that using class attributes after they are declared in the initialize method can work without the @.

# I mostly solidified iterating and accessing information from a nested data structure and understanding how to do that. I was confused before about the correct syntax and structure and how to use an iteration to retrieve information in a complex hash.