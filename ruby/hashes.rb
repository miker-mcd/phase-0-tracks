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

preference = {
=begin
  full_name:
  age:
  children:
  decor_theme: #pseudovintage, country fetch, boho psychedelic
  college_grad: #boolean
  hgtv: #boolean
  bedrooms: #integer
=end
}

puts "Client's full name:"
preference[:full_name] = gets.chomp

# puts "Client name #{preference[:full_name]}"

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
if preference[:college_grad] == "y" then preference[:college_grad] = true
elsif preference[:college_grad] == "n" then preference[:college_grad] = false
end

puts "Does the client watch HGTV(y/n)?"
preference[:hgtv] = gets.chomp
if preference[:hgtv] == "y" then preference[:hgtv] = true
elsif preference[:hgtv] == "n" then preference[:hgtv] = false
end

puts "Number of bedrooms:"
preference[:bedrooms] = gets.chomp
preference[:bedrooms] = preference[:bedrooms].to_i

p preference