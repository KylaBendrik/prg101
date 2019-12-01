eng = %w[b c d f g h j k l m n p q r s t v w x y z]
jin = %w[b j d v l j g l n m n g l l j d v w j y j]

def translate(word, eng, jin)
  cons_fixed = word.tr(eng.join, jin.join)

  chars = cons_fixed.split('')
  new_chars = []

  chars.each do |letter|
    if letter == "l"
      puts "L has been detected!"
      letter = "ng"
    end
    new_chars.push(letter)
  end
  final = new_chars.join
end

print "Enter word: "

word = gets.chomp

puts translate(word, eng, jin)