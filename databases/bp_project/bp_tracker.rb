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

def entry(db, diastolic, systolic, date, time)
  $DB.execute("INSERT INTO bloodpressure (diastolic, systolic, date, time) VALUES (?, ?, ?, ?)", [diastolic, systolic, date, time])
end

def print_table
  table = $DB.execute("SELECT diastolic, systolic, date FROM bloodpressure")
  table.each do |entry|
    puts "#{entry['date']}- Diastolic: #{entry['diastolic']} over #{entry['systolic']}."
  end
  # puts "Your blood pressure was #{table[0][1]} over #{table[0][2]}, on #{table[0][3]}."
end

# TO DO LIST

# Let a user enter a blood pressure reading and save it in the table

# print the results of last 10 entries along with average diastolic and systolic reading, highest diastolic/systolic and lowest diastolic/systolic

# Give user positive feedback if average is lower than recommended bp for age/weight of user
# Give supportive feedback if avg is higher using table of recommendations based on severity of difference between user and recommended average ex. diastolic or systolic is 10 points above national then message is "don't consume alcohol for one week"

# if new entry date is more than 10 days old, remind user to take blood pressure at least once per week

# display option of 30 or 60 previous entries with respective averages highs and lows

# handle multiple users with their own blood pressure logs

# TEST CODE

# entry(db, 130, 80, '2017-06-30', '8:00:00')
print_table