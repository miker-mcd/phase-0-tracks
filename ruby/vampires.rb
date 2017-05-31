puts "What is your name?"

employee_name = gets.chomp

puts "Your name is #{employee_name}."

puts "How old are you?"

employee_age = gets.chomp

employee_age = employee_age.to_i

puts "You are #{employee_age} years old."

puts "What year were you born?"

employee_year = gets.chomp

employee_year = employee_year.to_i

puts "You were born in #{employee_year}."

puts "Our company cafeteria serves garlic bread. Should we order some for you? (y/n)"

garlic_bread = gets.chomp

if garlic_bread == "y"
  garlic_yes = garlic_bread
  puts "You would like garlic bread."
elsif garlic_bread == "n"
  garlic_no = garlic_bread
  puts "You do not want garlic bread"
end

puts "Would you like to enroll in the company's health insurance? (y/n)"

insurance = gets.chomp

if insurance == "y"
  insurance_yes = insurance
  puts "You would like to enroll."
elsif insurance == "n"
  insurance_no = insurance
  puts "You do not want to enroll."
end

=begin
wolves_like_sunshine = true
wolves_like_garlic = true
vampires_like_sunshine = false
vampires_like_garlic = false
=end

time = Time.new

correct_age = time.year - employee_year

#correct_age = correct_age - 1

case
when (employee_age == correct_age) && (garlic_yes || insurance_yes)
  puts "Probably not a vampire."
#when (employee_age != correct_age) && (garlic_bread || insurance)
#  puts "Probably a vampire."
else
  puts "Results inconclusive."
end
