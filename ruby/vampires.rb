puts "What is your name?"

employee_name = gets.chomp

puts "How old are you?"

employee_age = gets.chomp

puts "What year were you born?"

employee_year = gets.chomp

puts "Our company cafeteria serves garlic bread. Should we order some for you? (y/n)"

garlic_bread = gets.chomp

puts "Would you like to enroll in the company's health insurance? (y/n)"

insurance = gets.chomp

wolves_like_sunshine = true
wolves_like_garlic = true
vampires_like_sunshine = false
vampires_like_garlic = false

time = Time.new

correct_age = time.year - employee_year.to_i
correct_age2 = time.year - employee_year.to_i - 1

case
  when employee_age == correct_age || correct_age2 && garlic_bread == "y" || insurance == "y"
    puts "Probably not a vampire."
  else
    puts "Results inconclusive"
  end
