class TaskList

  attr_reader :owner
  attr_accessor :due_date

  def initialize(owner, due_date)
    @owner = owner
    @due_date = due_date
    @list = {}
  end

  def add_new_location(location)
    # if the location doesn't exist in the list
    if @list[location].nil? # refactor
    # if @list[location] == nil one way to check if a key is in a hash
    # add that location to the list
      @list[location] = [] # we want multiple tasks at each location so we can put multiple tasks in that array
    else # if it does exist
      # send a reminder back to the user that it already exists
      puts "You're already stopping at #{location}!"
    end
  end

  def add_new_task(task, location)
    add_new_location(location) # keep code DRY. No point adding logic that you've already written. Extracting things out into different methods helps so that you can call methods within methods. Supports single responsibility design principle.
    if @list[location].include? task # we know that each key as a location has a value of an array and way that we can check if something exists in an array is include? method
      puts "You already have #{task} on your list!"
    else
      @list[location] << task # because this is an array we can't do @list[location] = task, so use shovel method to push task into array
    end
  end

  def remove_task(task, location)
    if @list[location].include? task
      # remove the task from the array
      @list[location].delete(task)
    else
      # remind the user they don't have that task at the location
      puts "You don't have #{task} at #{location}"
    end
  end

  def print_list
    @list.each do |location, list_of_tasks|
      puts "At #{location}:"
      list_of_tasks.each do |task|
        puts "- #{task}"
      end
    end
  end

  # predicate methods are methods with a question mark at the end and always return a boolean of true or false
  # helpful for letting us know the state of something - a game class challenge, have all the letters been guessed or did user run out of guesses numbers

  def is_past_due?(current_day)
    # compare the current day to the @due_date
    days_of_week = [
      "Sunday",
      "Monday",
      "Tuesday",
      "Wednesday",
      "Thursday",
      "Friday",
      "Saturday"
    ]
    # if no tasks on the list
    if @list.values.all? { |tasks| tasks.empty? } # goes through all the values and verifies that all of them meet a specific condition that we passed to the block and all the values are tasks which are arrays. Use built in method empty which will return true or false. Verifies if any of the tasks or our arrays return false that they are not empty
    # isn't past due, return false
      puts "You have completed all the tasks on your list!"
      false
    # elsif the current day is past the @due_date
    elsif days_of_week.index(@due_date) < days_of_week.index(current_day) # Where is due date in array of days of week? Using .index on an array will return the fixnum index of the due date
    # yes, it is past due. return true
      puts "You still have tasks to complete and they were due on #{@due_date}!"
      true
    # else the current day is before the @due_date
    else
    # return false
      puts "You still have until #{@due_date} to complete these tasks."
      false
    end
  end

end

# tyler_tasks = TaskList.new("Tyler", "Sunday")

# tyler_tasks.add_new_location("Target")
# tyler_tasks.add_new_location("Whole Foods")
# tyler_tasks.add_new_location("Car Wash")

# tyler_tasks.add_new_task("pick up catfood", "Target")
# tyler_tasks.add_new_task("buy milk", "Whole Foods")
# tyler_tasks.add_new_task("buy chicken", "Whole Foods")
# tyler_tasks.add_new_task("return items", "Target")
# tyler_tasks.add_new_task("get car washed", "Car Wash")

# tyler_tasks.remove_task("pick up cat food", "Target")
# tyler_tasks.remove_task("pick up cat food", "Target")

# tyler_tasks.print_list

tyler_tasks = TaskList.new("Tyler", "Wednesday")

tyler_tasks.add_new_task("pick up catfood", "Target")
tyler_tasks.add_new_task("buy milk", "Whole Foods")
tyler_tasks.add_new_task("buy chicken", "Whole Foods")
tyler_tasks.add_new_task("return items", "Target")
tyler_tasks.add_new_task("get car washed", "Car Wash")

# tyler_tasks.remove_task("pick up catfood", "Target")
# tyler_tasks.remove_task("buy milk", "Whole Foods")
# tyler_tasks.remove_task("buy chicken", "Whole Foods")
# tyler_tasks.remove_task("return items", "Target")
# tyler_tasks.remove_task("get car washed", "Car Wash")

tyler_tasks.remove_task("pick up catfood", "Target")
tyler_tasks.remove_task("buy milk", "Whole Foods")

tyler_tasks.is_past_due?("Monday")

# Iterating through a hash refresh
# list_array = []
# list_hash = {}

# list_array.each do |task|
#   puts "You have #{task} to do"
# end

# list_hash.each do |location, task|
#   puts "You have to #{task} at #{location}."
# end