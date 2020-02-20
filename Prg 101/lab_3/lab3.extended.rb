puts "You're talking to your grandmother, who is starting to lose her hearing: "

input = gets.chomp
stubborness = 3
counter = 0

while true
  if input == input.upcase && input != "BYE"
    puts "NO, NOT SINCE #{rand(1930..1950)}!"
    counter = 0
    input = gets.chomp
  elsif input == "BYE"
    counter += 1
    if counter == stubborness
      break
    end
    input = gets.chomp
  elsif input != "BYE"
    puts "HUH?! SPEAK UP, SONNY!"
    counter = 0
    input = gets.chomp
  end



end