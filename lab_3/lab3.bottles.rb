on_wall = 99
line_width = 35

def plural(num)
  if num > 1
    "s"
  end
end

while on_wall > 0
  puts "~" * line_width
  puts "#{on_wall} bottle#{plural(on_wall)} of beer on the wall,".center(line_width)
  puts "#{on_wall} bottle#{plural(on_wall)} of beer!".center(line_width)
  puts "Take one down,".center(line_width)
  on_wall -= 1
  puts "Pass it around,".center(line_width)

  if on_wall > 0
    puts "#{on_wall} bottle#{plural(on_wall)} of beer!".center(line_width)
  else
    puts "No more bottles of beer!".center(line_width)
  end
end