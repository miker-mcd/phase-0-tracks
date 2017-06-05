=begin
  Interior Designer Preference
  - Prompt designer/user for preference information.
  - Convert user input to appropriate data type.
  - Display the preference information to the user after all questions are answered.
    - if designer/user made a mistake.
      - allow for one edit to a preference.
    - if user did not make a mistake.
      - prompt user to type "none".
  - Display latest version of preference information and exit program.
=end

# Set up empty hash to put preference information into.
preference = {
=begin
  full_name: string
  age: integer
  children: integer
  decor_theme: string
  college_grad: boolean
  hgtv: boolean
  bedrooms: integer
=end
}

# Collect client preference information
puts "Client's full name:"
preference[:full_name] = gets.chomp

puts "Client age:"
preference[:age] = gets.chomp
preference[:age] = preference[:age].to_i

puts "Client number of children:"
preference[:children] = gets.chomp
preference[:children] = preference[:children].to_i

puts "Preferred decor theme:"
preference[:decor_theme] = gets.chomp

puts "College grad(y/n):"
preference[:college_grad] = gets.chomp
if preference[:college_grad] == "y"
  preference[:college_grad] = true
elsif preference[:college_grad] == "n"
  preference[:college_grad] = false
end

puts "Does the client watch HGTV(y/n)?"
preference[:hgtv] = gets.chomp
if preference[:hgtv] == "y"
  preference[:hgtv] = true
elsif preference[:hgtv] == "n"
  preference[:hgtv] = false
end

puts "Number of bedrooms:"
preference[:bedrooms] = gets.chomp
preference[:bedrooms] = preference[:bedrooms].to_i

puts "Here is the client information: #{preference}"

# Prompt user to fix preference key mistake.
puts "If you made a mistake, please enter the name of the preference category to fix, otherwise type 'none' to finish."
mistake = gets.chomp

# If response is "none" then skip.
if mistake == "none"
  puts "Client preferences completed, thank you."
# Prompt user to enter correct preference value.
else
  puts "Please enter new value for preference"
  preference_fix = mistake.to_sym
  data_fix = gets.chomp
  preference[preference_fix] = data_fix
  if data_fix == "y"
    preference[preference_fix] = true
  elsif data_fix == "n"
    preference[preference_fix] = false
  elsif preference_fix == :age || :children || :bedrooms
      preference[preference_fix] = data_fix.to_i
  # Display updated version of preferences to user.
  puts "Here is the latest version of the client preferences: #{preference}"
  # End greeting.
  puts "Thank you!"
end
end