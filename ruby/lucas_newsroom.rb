class Newsroom
  attr_reader :name
  attr_accessor :budget

  def initialize(name, budget)
    @name = name
    @budget = budget
    @reporters = {}
  end

  def add_reporter(name, skills)
    if has_budget?(name)
      if @reporters.has_key?(name) == false
      @reporters[name] = skills
    else
      puts "You can't hire someone else with the same #{name}!"
    end
    else
      puts "You can't afford #{name}!"
    end
  end

  def salary_for(name)
    name.length * 10_000
  end

  def total_salaries
    @reporters.keys.reduce(0) do |sum, name|
      sum + salary_for(name)
    end
  end

  def has_budget?(new_name)
    (budget - total_salaries) >= salary_for(new_name)
  end

  def friendly_print
    puts "Welcome to the #{name} Newsroom"
    puts
    puts "Your reporting team is:"
    @reporters.each do |name, skills|
      puts "- #{name}, specializing in #{skills.join(", ")}!"
    end
    puts
    puts "Thank you for watching! Good night!"
  end

  def find_reporters_with_skill(skill)
    skilled_reporters = @reporters.select do |name, skills|
      skills.include?(skill)
    end
    skilled_reporters.keys
  end

end

# DRIVER CODE

newsroom = Newsroom.new("CNN", 300_000)
newsroom.add_reporter("Anderson Cooper", ["politics", "economics", "grey hair"])
newsroom.add_reporter("Wolf Blitzer", ["politics", "moustache", "yelling"])
newsroom.add_reporter("Jim Acosta", ["economics", "smiling"])
newsroom.friendly_print
p newsroom.find_reporters_with_skill("politics")