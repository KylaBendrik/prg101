input = File.read('./frequency_input.txt').downcase

# input is string of words: "dangsin-ege insa, chinjeolhan chingu."
# split into array, getting rid of all punctuation: [dansin, ege, insa, chinjeolhan, chingu]
pretty_string = input.tr(',.-?-!',' ')

array = pretty_string.split(' ')
puts array

#count characters

characters = Hash.new

def count_alphabet(input, characters)
  ('a'..'z').each do |letter|
    characters[letter] = 0
  end

  input.each do |word|
    chars = word.split('')
    chars.each do |letter|
      characters[letter] += 1
    end
  end
  puts characters
end

count_alphabet(array, characters)