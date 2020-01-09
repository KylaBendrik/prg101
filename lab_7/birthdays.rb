require 'date'

lines = File.read('inputs/birthdays.txt')

arg = lines.each_line.map do |line|
  name, birthday = line.split(/, \s*/,2)
  puts name
  puts birthday
  [name, Date.parse(birthday)]
end

bday_this_year = Date.new(Date.today.year, bday.month, bday.day)

if Date.today > bday_this_year
  bday_this_year = bday_this_year.next_year
end

pp bday_hash = Hash[arg]