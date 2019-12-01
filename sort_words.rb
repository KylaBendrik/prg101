word_collection = []

while true
  print "Type in a word, please: "
  word = gets.chomp

  break if word.empty?

  word_collection.push word

end

puts word_collection.sort