# Make a mixin version of the Shout module

module Shout
  def yell_angrily(words)
    puts "#{words}!!!" + " :("
  end

  def yelling_happily(words)
    puts "#{words}" + " " + "Yipppeeee!!!"
  end
end

# Write two classes representing anythign that might shout
# Include the Shout module in those classes

class Students
   include Shout
end

class Goats
  include Shout
end

# # DRIVER CODE

# Instantiate instances of the classes and calls the two module methods on each instance

michael = Students.new
michael.yell_angrily("I love coding")
michael.yelling_happily("I finished the challenge.")

henry = Goats.new
henry.yell_angrily("Leave me alone")
henry.yelling_happily("I'm the G.O.A.T.")

# # OLD CODE

# module Shout

#   def self.yell_angrily(words)
#     words + "!!!" + " :("
#   end

#   def self.yelling_happily(words)
#     words + " " + "Yipppeeee!!!"
#   end

# end

# DRIVER CODE

# Shout.yell_angrily("I love coding")
# Shout.yelling_happily("I finished the challenge.")