def trip_over_curb
  raise "Whoa!"
end

begin
  trip_over_curb
rescue
  puts "caught you!"
end