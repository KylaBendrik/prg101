require 'date'

puts "what is your birthday?" 

birthday = Date.parse(gets.chomp)
today = Time.new

birthtime = Time.local(birthday.year, birthday.month, birthday.day)

puts birthday
puts birthtime

diff = (today - birthtime).to_i

to_billion = 1_000_000_000 - diff
mins = to_billion/60
hours = mins/60
days = hours/24
years = days/365.25

puts "assuming you were born on the stroke of midnight, you are #{diff} seconds old!"

puts "You will be 1 billion seconds old in #{to_billion} seconds!"

puts "... which is:
 about #{mins} minutes, or 
 about #{hours} hours, or
 about #{days} days, or
 about #{years} years"

 puts "You will be 1 billion seconds old on #{birthtime + 1_000_000_000}"

