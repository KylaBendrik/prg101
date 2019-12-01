print "Please enter your name: "
name = gets.chomp
puts "Hello, " + name + "! Welcome to the number guessing game. Please guess a number between 1 and 100"
goal = rand(1..100)
guesses = 0

until guesses == 10
  puts "You have #{10 - guesses} guesses left"
  answer = gets.to_i
  guesses += 1


  if answer > goal
    puts "Oops! Your answer is too HIGH!"
  elsif answer < goal
    puts "Oops! Your answer is too LOW!"
  elsif answer == goal
    puts "Good job, " + name + "! You guessed my number in " + guesses.to_s + " guesses!"
    break
  end
end

if guesses == 10
  puts "Sorry, you didn't get my number. My number was " + goal.to_s
end