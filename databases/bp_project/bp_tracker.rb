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
  db.execute("INSERT INTO bloodpressure (diastolic, systolic, date, time) VALUES (?, ?, ?, ?)", [diastolic, systolic, date, time])
end

def print_table
  table = $DB.execute("SELECT diastolic, systolic, date FROM bloodpressure")
  table.each do |entry|
    puts "#{entry['date']}- Diastolic: #{entry['diastolic']} over #{entry['systolic']}."
  end
  # puts "Your blood pressure was #{table[0][1]} over #{table[0][2]}, on #{table[0][3]}."
end

# TEST CODE

# entry(db, 130, 80, '2017-06-30', '8:00:00')
print_table