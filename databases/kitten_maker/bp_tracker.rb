require 'sqlite3'

db = SQLite3::Database.new("bp_log.db")

create_table_cmd = <<-SQL
  CREATE TABLE IF NOT EXISTS bp_log(
  bp_id INTEGER PRIMARY KEY,
  diastolic INT,
  systolic INT,
  date DATE,
  time TIME
  )
SQL

db.execute(create_table_cmd)