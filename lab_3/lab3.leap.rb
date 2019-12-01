print "enter a starting year: "
year1 = gets.to_i
print "enter an ending year: "
year2 = gets.to_i

#leap years are divisible by 4
#except when they are divisible by 100
#EXCEPT when they are divisible by 400

#first, lets make an array of all the years between year1 and year 2:
all_years = []
current = year1

while year2 + 1 > current
  all_years.push current
  current +=1
end

#puts all_years

#then, we'll make a function to find if it's a leap year

def if_leap(year)
  if year % 400 == 0
    true
  elsif year % 100 != 0 && year % 4 == 0
    true
  else
    false
  end
end

all_years.each {|this_year|
  if if_leap(this_year)
    puts (this_year)
  end
}