require 'date'

puts "What year were you born?"
year = gets.chomp.to_i

estimate = Date.new(year, Date.today.month, Date.today.day)


age = Date.today.year - year

puts "Congratulations! You are #{age} years old!"

age.times do
  puts "SPANK!"
end
