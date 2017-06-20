# Virus Predictor

# I worked on this challenge [by myself, with: Michael].
# We spent [#] hours on this challenge.

# EXPLANATION OF require_relative
#require_relative compliments the built in method require.allows you to load/import an outside file still in the directory to have access to the data.
#differs from require does not offer a good solution for loading files within projects code. might be good to access test data( not intended for outside use)
require_relative 'state_data'

class VirusPredictor
# creates an instance involving three arguments:state of rigin, pop density, and population.
  def initialize(state_of_origin, population_density, population)
    @state = state_of_origin
    @population = population
    @population_density = population_density
  end
#method that executes the other called methods.
  def virus_effects
    predicted_deaths(@population_density, @population, @state)
    speed_of_spread(@population_density, @state)
  end

 private
# method that takes three arguments. calculates the number of deaths by assessing population subsequently/based on the population density range
  def predicted_deaths(population_density, population, state)
    # predicted deaths is solely based on population density
    if @population_density >= 200
      number_of_deaths = (@population * 0.4).floor
    elsif @population_density >= 150
      number_of_deaths = (@population * 0.3).floor
    elsif @population_density >= 100
      number_of_deaths = (@population * 0.2).floor
    elsif @population_density >= 50
      number_of_deaths = (@population * 0.1).floor
    else
      number_of_deaths = (@population * 0.05).floor
    end

   print "#{@state} will lose #{number_of_deaths} people in this outbreak"

 end
# method that takes in two arguments and evaulates how quickly the disease will spread based off population density.
  def speed_of_spread(population_density, state) #in months
    # We are still perfecting our formula here. The speed is also affected
    # by additional factors we haven't added into this functionality.
    speed = 0.0

   if @population_density >= 200
      speed += 0.5
    elsif @population_density >= 150
      speed += 1
    elsif @population_density >= 100
      speed += 1.5
    elsif @population_density >= 50
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

STATE_DATA.each do |state, info|
  current_state = VirusPredictor.new(state, info[:population_density], info[:population])
  current_state.virus_effects
  # p info[:population_density]
  # p state
  # p info
end