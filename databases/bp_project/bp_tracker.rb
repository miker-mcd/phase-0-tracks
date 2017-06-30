require 'sqlite3'

db = SQLite3::Database.new("bloodpressure.db")

create_table_cmd = <<-SQL
  CREATE TABLE IF NOT EXISTS bloodpressure(
  bp_id INTEGER PRIMARY KEY,
  diastolic INT,
  systolic INT,
  date DATE,
  time TIME
  )
SQL

db.execute(create_table_cmd)