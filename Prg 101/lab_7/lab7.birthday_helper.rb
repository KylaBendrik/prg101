require 'date'

lines = File.read('inputs/birthdays.txt')

arg = lines.each_line.map do |line|
  name, bday = line.split(/, \s*/,2)
  puts ' - ' + name
  [name, Date.parse(bday)]
end

bday_hash = Hash[arg]

puts "Whose birthday are you looking for?"

quest = gets.chomp

if bday_hash.include?(quest)
  bday = bday_hash[quest]
  next_bday = Date.new(Date.today.year, bday.month, bday.day)

  if Date.today > next_bday
    next_bday = next_bday.next_year
  end

  if bday.month == Date.today.month && bday.day == Date.today.day
    puts "Today is #{quest}'s birthday! "
    puts "#{next_bday.year - bday.year} years old today!"
  else
    
  puts "#{quest}'s next birthday will be: #{next_bday}"
  puts "#{quest.partition(" ").first} will be #{next_bday.year - bday.year} years old!"

  end
end


