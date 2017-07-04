require 'sqlite3'

$BP = SQLite3::Database.new("bloodpressure.db")
$BP.results_as_hash = true

create_bp_table = <<-SQL
  CREATE TABLE IF NOT EXISTS bloodpressure(
  bp_id INTEGER PRIMARY KEY,
  date DATE,
  systolic INT,
  diastolic INT,
  user_id INT,
  FOREIGN KEY (user_id) REFERENCES users(users_id)
  )
SQL

create_users_table = <<-SQL
  CREATE TABLE IF NOT EXISTS users(
  users_id INTEGER PRIMARY KEY,
  name VARCHAR(255),
  age INT
  )
SQL

$BP.execute(create_bp_table)
$BP.execute(create_users_table)

def new_user(name, age)
  $BP.execute("INSERT INTO users (name, age) VALUES (?, ?)", [name, age])
end

def get_user_id(name)
  user = name
  id = $BP.execute("SELECT users_id FROM users WHERE name = (?)", [user])
  user_id = id[0]['users_id']
end

# Let a user enter a blood pressure reading and save it in the table
def new_entry(date, systolic, diastolic, user_id)
  $BP.execute("INSERT INTO bloodpressure (date, systolic, diastolic, user_id) VALUES (?, ?, ?, ?)", [date, systolic, diastolic, user_id])
end

# # Make a sample log of entries
# day = Date.new(2017,03,31)
# 60.times do
# # generate a random systolic number between 100-180
#   sys = (100..180).to_a.sample
# # generate a random diastolic number 70-110
#   dia = (70..110).to_a.sample
# # a recurring day - 2017-06-(01-30)
#   day = day.next_day
#   new_entry((day.to_s), sys, dia, 3)
# end

# display option of 10, 30 or 60 previous entries with average diastolic and systolic reading, highest diastolic/systolic and lowest diastolic/systolic
def last_n_entries(user_id, days_request)
  id = user_id
  number = days_request
  results = $BP.execute(
    "SELECT * FROM (SELECT * FROM bloodpressure WHERE user_id = (?)ORDER BY bp_id DESC LIMIT (?))
    ORDER BY bp_id ASC", [id, number])
  puts "Last #{number} entries:"
  puts "-----------------------------"
  puts
  results.each do |entry|
    puts "#{entry['bp_id']} #{entry['date']} SYS: #{entry['systolic']} DIA: #{entry['diastolic']}"
  end
  puts
  puts "-----------------------------"
  puts
end

def highest_sys(user_id, days_request)
  id = user_id
  number = days_request
  high_sys = $BP.execute(
    "SELECT systolic FROM (SELECT * FROM bloodpressure WHERE user_id = (?) ORDER BY bp_id DESC LIMIT (?))
    ORDER BY systolic DESC LIMIT 1", [id, number])
  sys = high_sys[0]['systolic']
end

def highest_dia(user_id, days_request)
  id = user_id
  number = days_request
  high_dia = $BP.execute(
    "SELECT diastolic FROM (SELECT * FROM bloodpressure WHERE user_id = (?)ORDER BY bp_id DESC LIMIT (?))
    ORDER BY diastolic DESC LIMIT 1", [id, number])
  dia = high_dia[0]['diastolic']
end

def sys_average(user_id, days_request)
  id = user_id
  number = days_request
  results = $BP.execute(
    "SELECT * FROM (SELECT * FROM bloodpressure WHERE user_id = (?) ORDER BY bp_id DESC LIMIT (?))
    ORDER BY bp_id ASC", [id, number])
  sys_total = 0
  results.each do |entry|
    sys_total += entry['systolic']
  end
  sys_avg = sys_total / results.count
end

def dia_average(user_id, days_request)
  id = user_id
  number = days_request
  results = $BP.execute(
    "SELECT * FROM (SELECT * FROM bloodpressure WHERE user_id = (?) ORDER BY bp_id DESC LIMIT (?))
    ORDER BY bp_id ASC", [id, number])
  dia_total = 0
  results.each do |entry|
    dia_total += entry['diastolic']
  end
  dia_avg = dia_total / results.count
end

# Give user positive feedback if average is lower than normal bp
# normal sys less than 120, dia less than 80
# Give supportive feedback if avg is
# prehyper sys 120-139 OR dia 80-89
# hyper stage 1 sys 140-159 OR dia 90-99
# hyper stage 2 sys >= 160 OR dia >= 100
# Crisis sys >= 180 OR dia >= 110
def feedback(sys_average, dia_average)
  sys = sys_average
  dia = dia_average
  case
    when sys >= 180 || dia >= 110
      puts "***EMERGENCY*** Your blood pressure is at a dangerous level. Visit an ER immediately."
    when sys >= 160 || dia >= 100
      puts "Hypertension Stage 2. Please schedule an appointment with your doctor for further treatment."
    when sys > 140 || dia > 90
        puts "Hypertension Stage 1. Remember to take your medication, avoid high-sodium foods, alcohol and reduce stress."
    when sys > 120 || dia > 80
        puts "Prehypertension. Try to get 7-8 hours of sleep every night."
    else
      puts "Normal Blood Pressure. Way to go!"
  end
end

def last_date(user_id)
  id = user_id
  date = $BP.execute(
    "SELECT date FROM bloodpressure WHERE user_id = (?)
    ORDER BY date DESC LIMIT 2", [id])
    old_date = date[1]['date'].split("-")
    day = Date.new(old_date[0].to_i, old_date[1].to_i, old_date[2].to_i)
end

def new_date(user_id)
  id = user_id
  date = $BP.execute(
    "SELECT date FROM bloodpressure WHERE user_id = (?)
    ORDER BY date DESC LIMIT 1", [id])
    new_date = date[0]['date'].split("-")
    day = Date.new(new_date[0].to_i, new_date[1].to_i, new_date[2].to_i)
end

# TEST CODE


# User greeting
  puts "Welcome to BP Tracker"
  puts "What would you like to do today?"
  puts "Type 'new user', 'new entry', 'view history' or 'quit' to exit the program."

input = gets.chomp

# IF new user
  # get user name and age
  # store name and age in users table
  # provide user id to user
  # proceed to new bp entry?
# ELSE
  # Thank user for considering bp tracker and exit program
if input == "new user"
  puts "Signing up is simple! What is your first and last name?"
  new_name = gets.chomp
  puts "Thank you, #{new_name}!"
  puts "Please enter your age."
  new_age = gets.chomp.to_i
  new_user(new_name, new_age)
  puts "Your user id number is #{get_user_id(new_name)}."
  puts "The user id number is required for new entries and viewing your history so don't forget it!"
# IF new bp entry
  # get user id
  # how many entries?
  # FOR EACH entry
    # get entry date, sys, dia, (user id)
  # ENDFOREACH
  # display default last 10 entries with feedback
elsif input == "new entry"
  puts "Let's get started! What is your user id number?"
  user_id = gets.chomp.to_i
  puts "How many blood pressure entries would you like to make?"
  number = gets.chomp.to_i
  number.times do
    puts "Please enter the date of the BP reading (YYYY-MM-DD)."
    date = gets.chomp
    puts "Please enter the systolic number."
    sys = gets.chomp.to_i
    puts "Please enter the diastolic number."
    dia = gets.chomp.to_i
    new_entry(date, sys, dia, user_id)
  end
  last_n_entries(user_id, 10)
  puts "Highest SYS: #{highest_sys(user_id, 10)}"
  puts "Highest DIA: #{highest_dia(user_id, 10)}"
  puts "Average SYS: #{sys_average(user_id, 10)}"
  puts "Average DIA: #{dia_average(user_id, 10)}"
  feedback(sys_average(user_id, 10), dia_average(user_id, 10))
    if (new_date(user_id) - last_date(user_id)).  to_i > 10
      puts "It's been more than ten days since your last BP entry. Please enter a BP at least once a week to better monitor your health."
    else
      puts "Checking your BP regularly is a great health habit. Keep it up!"
    end
# ELSIF user wants to view history
elsif input == "view history"
  # Get user id
  puts "Type your user id and hit enter"
  user_id = gets.chomp.to_i
  # Ask user how many previous entries (10, 30, 60)
  puts "Type a number of days to view entries (10, 30 or 60)"
  number_of_days = gets.chomp.to_i
  # Display results with feedback
  last_n_entries(user_id, number_of_days)
  puts "Highest SYS: #{highest_sys(user_id, number_of_days)}"
  puts "Highest DIA: #{highest_dia(user_id, number_of_days)}"
  puts "Average SYS: #{sys_average(user_id, number_of_days)}"
  puts "Average DIA: #{dia_average(user_id, number_of_days)}"
  feedback(sys_average(user_id, number_of_days), dia_average(user_id, number_of_days))
  # IF new entry date is more than 10 days old
    if (new_date(user_id) - last_date(user_id)).to_i > 10
    # remind user to take blood pressure at least once per week
      puts "It's been more than ten days since your last BP entry. Please enter a BP at least once a week to better monitor your health."
# ELSE
    else
  # give positive feedback
      puts "Checking your BP regularly is a great health habit. Keep it up!"
# ENDIF
    end
end

# new_user("Homer Simpson", 39)
# new_user("Ned Flanders", 60)
# new_user("Edna Krabappel", 41)