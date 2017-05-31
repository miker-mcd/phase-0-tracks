puts 'What is the hamster\'s name?'
name = gets.chomp
puts "The hamster\'s name is #{name}."

puts 'What is the volume level of the hamster?(1-10)'
volume = gets.chomp
volume = volume.to_f
puts "The volume of the hamster is #{volume}."

puts 'What is the fur color of the hamster?'
fur = gets.chomp
puts "The fur color of the hamster is #{fur}."

puts 'Is the hamster a good candidate for adoption?(y/n)'
candidate = gets.chomp

if candidate == 'y'
  candidate = true
  puts 'The hamster is a good candidate for adoption.'
elsif candidate == 'n'
  candidate = false
  puts 'The hamster is not a good candidate for adoption.'
end

puts 'What is the estimated age of the hamster?'
age = gets.chomp

if age == ''
  age = nil
  puts "No name provided."
else
  age = age.to_i
  puts "The age of the hamster is #{age}."
end