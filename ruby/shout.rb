module Shout

  def self.yell_angrily(words)
    words + "!!!" + " :("
  end

  def self.yelling_happily(words)
    words + " " + "Yipppeeee!!!"
  end

end

# DRIVER CODE

Shout.yell_angrily("I love coding")
Shout.yelling_happily("I finished the challenge.")