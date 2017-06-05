puts "How many employees will be processed?"

employee_number = gets.chomp

employee_number = employee_number.to_i

until employee_number == 0

puts "What is your name?"

employee_name = gets.chomp

puts "Hi #{employee_name}."

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

time = Time.new

correct_age = time.year - employee_year

# correct_age2 = correct_age - 1

bad_allergy = "sunshine"

done_allergy = "done"

input = ""

while input != done_allergy
  puts "Please list any allergies, one at a time, and type \"done\" when finished."
  input = gets.chomp
if input == done_allergy
  break
elsif input == bad_allergy
  break
end
end

case
when input == bad_allergy
  puts "Probably a vampire."
when (employee_name == "Drake Cula") || (employee_name == "Tu Fang")
  puts "Definitely a vampire."
when (employee_age == correct_age) && (garlic_yes || insurance_yes)
  puts "Probably not a vampire."
when (employee_age != correct_age) && (garlic_no && insurance_no)
  puts "Almost certainly a vampire."
when (employee_age != correct_age) && (garlic_no || insurance_no)
  puts "Probably a vampire."
else
  puts "Results inconclusive."
end

employee_number -= 1
end

puts "Actually, never mind! What do these questions have to do with anything? Let's all be friends."