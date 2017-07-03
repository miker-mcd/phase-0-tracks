require 'sqlite3'

$DB = SQLite3::Database.new("bloodpressure.db")
$DB.results_as_hash = true

create_table_cmd = <<-SQL
  CREATE TABLE IF NOT EXISTS bloodpressure(
  bp_id INTEGER PRIMARY KEY,
  diastolic INT,
  systolic INT,
  date DATE,
  time TIME
  )
SQL

$DB.execute(create_table_cmd)

# Let a user enter a blood pressure reading and save it in the table
def new_entry(diastolic, systolic, date, time)
  # query = <<-SQL
  #   INSERT INTO bloodpressure (diastolic, systolic, date, time)
  #   VALUES (?, ?, ?, ?)
  #   SQL
  #   , [diastolic, systolic, date, time]
  #   $DB.execute(query)
    # $DB.execute(query, (diastolic, systolic, date, time))
    # , [diastolic, systolic, date, time])
  $DB.execute("INSERT INTO bloodpressure (diastolic, systolic, date, time) VALUES (?, ?, ?, ?)", [diastolic, systolic, date, time])
end

# if new entry date is more than 10 days old, remind user to take blood pressure at least once per week

def last_date
  date = $DB.execute(<<-SQL
    SELECT date FROM bloodpressure
    ORDER BY date DESC LIMIT 2
    SQL
    )
    old_date = date[1]['date'].split("-")
    day = Date.new(old_date[0].to_i, old_date[1].to_i, old_date[2].to_i)
end

def new_date
  date = $DB.execute(<<-SQL
    SELECT date FROM bloodpressure
    ORDER BY date DESC LIMIT 1
    SQL
    )
    new_date = date[0]['date'].split("-")
    day = Date.new(new_date[0].to_i, new_date[1].to_i, new_date[2].to_i)
  # difference = entry_date[0]['date'] - entry_date[1]['date']
end

# # Make a sample log of entries
# day = Date.new(2017,05,31)
# 30.times do
# # generate a random diastolic number 70-110
#   dia = (70..110).to_a.sample #<= 88
# # generate a random systolic number between 100-180
#   sys = (100..180).to_a.sample # <= 137
# # a recurring day - 2017-06-(01-30)
#   day = day.next_day
#   # day = day.to_s #<= "2017-06-01"
#   create_entry($DB, dia, sys, (day.to_s), '7:00:00')
# end

# print the results of last 10 entries along with average diastolic and systolic reading, highest diastolic/systolic and lowest diastolic/systolic

def last_ten_entries
  results = $DB.execute(<<-SQL
    SELECT * FROM (SELECT * FROM bloodpressure ORDER BY bp_id DESC limit 10)
    ORDER BY bp_id ASC
    SQL
    )
  puts "Last 10 entries:"
  puts "-----------------------------"
  puts
  results.each do |entry|
    puts "#{entry['bp_id']} #{entry['date']}- DIA: #{entry['diastolic']} SYS: #{entry['systolic']}"
  end
  puts
  puts "-----------------------------"
  puts
end

def sys_average
  results = $DB.execute(<<-SQL
    SELECT * FROM (SELECT * FROM bloodpressure ORDER BY bp_id DESC limit 10)
    ORDER BY bp_id ASC
    SQL
    )
  sys_total = 0
  results.each do |entry|
    sys_total += entry['systolic']
  end
  sys_avg = sys_total / results.count
end

def dia_average
  results = $DB.execute(<<-SQL
    SELECT * FROM (SELECT * FROM bloodpressure ORDER BY bp_id DESC limit 10)
    ORDER BY bp_id ASC
    SQL
    )
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
# hyper stage 2 sys >= 160 or dia >= 100
# Crisis sys >= 180 or dia >= 110
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

def highest_sys
  high_sys = $DB.execute(<<-SQL
    SELECT systolic FROM bloodpressure
    ORDER BY systolic DESC LIMIT 1
    SQL
    )
  high_sys[0]['systolic']
end

def highest_dia
  high_dia = $DB.execute(<<-SQL
    SELECT diastolic FROM bloodpressure
    ORDER BY diastolic DESC LIMIT 1
    SQL
    )
  high_dia[0]['diastolic']
end

def print_table
  table = $DB.execute("SELECT diastolic, systolic, date FROM bloodpressure")
  table.each do |entry|
    puts "#{entry['date']}- DIA: #{entry['diastolic']} SYS: #{entry['systolic']}."
  end
end

# TO DO LIST

# if user enters a bp entry at least once every seven days give positive feedback

# display option of 30 or 60 previous entries with respective averages highs and lows

# handle multiple users with their own blood pressure logs

# TEST CODE

# print_table
last_ten_entries
# puts "Highest SYS: #{highest_sys}"
# puts "Highest DIA: #{highest_dia}"
# puts "Total Average SYS: #{sys_average}"
# puts "Total Average DIA: #{dia_average}"
feedback(sys_average, dia_average)
# new_entry(70, 135, '2017-07-09', '8:00:00')
# last_ten_entries
new_entry(75, 128, '2017-07-25', '8:00:00')
last_ten_entries
if (new_date - last_date).to_i > 10
  puts "It's been more than ten days since your last BP entry. Please enter a BP at least once a week to better monitor your health."
else
  puts "Checking your BP regularly is a great health habit. Keep it up!"
end