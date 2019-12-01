puts "You're talking to your grandmother, who is starting to lose her hearing: "

input = gets.chomp

while input != "BYE"
  if input == input.upcase
    puts "NO, NOT SINCE #{rand(1930..1950)}!"
    input = gets.chomp
  else
    puts "HUH?! SPEAK UP, SONNY!"
    input = gets.chomp
  end
end