# frozen_string_literal: true

puts 'please enter word'
str1 = gets.chomp.downcase

arr1 = []

def string_to_array(my_string, my_array)
  i = 0
  my_string.length.times do
    my_array.push my_string.slice(i)
    i += 1
  end
end

def umtpohs(word_array)
  cons = %w[a e i b c d f g h j k l m n p q r s t v w x z o u y]
  ximh = cons.reverse
  word_array.map do |letter|
    index = cons.index(letter)
    ximh[index]
  end
end

def umtpohs_hash(word_array)
  cons = %w[a e i b c d f g h j k l m n p q r s t v w x z o u y]
  trans_table = Hash[cons.zip(cons.reverse)]
  word_array.map do |letter|
    trans_table[letter]
  end
end

def umtpohs_tr(word_string)
  cons = %w[a e i b c d f g h j k l m n p q r s t v w x z o u y].join
  ximh = cons.reverse

  word_string.tr(cons, ximh)

end

string_to_array(str1, arr1)

puts umtpohs_tr(str1)

