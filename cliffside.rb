puts "\tStop!"
print "\tWhat is your name? "
name = gets.chomp
print "\tWhat is your quest? "
quest = gets.chomp

questions = ["What is the air speed velocity of a coconut-laden swallow? ", "what is your favorite color? ", "what is your favorite fruit? "]
final = questions.sample

print "\t" + final
answer = gets.chomp

if answer.include? "I don't know"
  puts "\t*you fly off cliff*"
elsif answer.downcase.include? "african or"
  puts "\tWhat? I don't know that! *AAAAAGGGGHHH!!!!*"
else
  puts "\t" + name + " on the quest of \'" + quest + "\': you may pass. Have a good day!"
end