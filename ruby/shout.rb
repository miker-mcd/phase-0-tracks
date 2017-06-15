module Shout
  def yell_angrily(words)
    puts "#{words}!!!" + " :("
  end

  def yelling_happily(words)
    puts "#{words}" + " " + "Yipppeeee!!!"
  end
end

class Students
   include Shout
end

class Goats
  include Shout
end

michael = Students.new
michael.yell_angrily("I love coding")
michael.yelling_happily("I finished the challenge.")

henry = Goats.new
henry.yell_angrily("Leave me alone")
henry.yelling_happily("I'm the G.O.A.T.")

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