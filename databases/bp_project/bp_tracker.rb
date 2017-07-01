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
def create_entry(db, diastolic, systolic, date, time)
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
  results.each do |entry|
    puts "#{entry['date']}- DIA: #{entry['diastolic']} SYS: #{entry['systolic']}."
  end
end

def print_table
  table = $DB.execute("SELECT diastolic, systolic, date FROM bloodpressure")
  table.each do |entry|
    puts "#{entry['date']}- DIA: #{entry['diastolic']} SYS: #{entry['systolic']}."
  end
end

# TO DO LIST

# Give user positive feedback if average is lower than recommended bp for age/weight of user
# Give supportive feedback if avg is higher using table of recommendations based on severity of difference between user and recommended average ex. diastolic or systolic is 10 points above national then message is "don't consume alcohol for one week"

# if new entry date is more than 10 days old, remind user to take blood pressure at least once per week

# display option of 30 or 60 previous entries with respective averages highs and lows

# handle multiple users with their own blood pressure logs

# TEST CODE

# print_table
last_ten_entries