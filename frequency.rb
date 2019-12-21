# frozen_string_literal: true

input = File.read('./frequency_input.txt').downcase

# input is string of words: "dangsin-ege insa, chinjeol"
# split into array, getting rid of all punctuation:[dansin, ege, insa, chinjeol]
array = input.tr(',.-?-!', ' ').split(' ')

CONSONANTS = %w[b c d f g h j k l m n p q r s t v w x z].freeze
VOWELS = %w[a e i o u y].freeze

def count_clusters(array)
  clusters = Hash.new(0)
  new_cluster = []
  char_type = "empty"

  array.each do |word|
    puts "#{word}"
    word.chars.each do |char|
      clusters[char] +=1
    end
  end

  clusters
end

puts count_clusters(['ace'])
