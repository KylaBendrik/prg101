# frozen_string_literal: true

input = File.read('./frequency_input.txt').downcase

# input is string of words: "dangsin-ege insa, chinjeol"
# split into array, getting rid of all punctuation:[dansin, ege, insa, chinjeol]
input = input.split /\W+/
puts input

CONSONANTS = %w[b c d f g h j k l m n p q r s t v w x z].freeze
VOWELS = %w[a e i o u y].freeze

class Counter
  
  def count_clusters(array)
    clusters = Hash.new(0)
    new_cluster = []
    char_type = 'empty'

    array.each do |word|
      last_char_type = :empty
      current_char_type = :empty
      current_cluster = []

      word.chars.each do |char|
        clusters[char] += 1 # always count single letters

        current_char_type = if VOWELS.include?(char)
                              :vowel
                            else
                              :consonant
                            end

        # if we're at the beginning of the word, just add letter to cluster (A)
        # if last letter is the same type as this letter, add letter to cluster (B)
        # if last letter is different, submit cluster, start new cluster, add letter (C)
        # if cluster.join == "ng", submit cluster, start new cluster, add letter (D)

        if last_char_type != current_char_type || current_cluster.join == 'ng'
          unless current_char_type == :consonant
            submit(current_cluster, clusters)
          end
          current_cluster = []
        end

        current_cluster.push(char)

        last_char_type = current_char_type
        current_char_type = :empty
      end
    end

    clusters
  end
  def submit(cluster, clusters)
    clusters[cluster.join] += 1
  end
end

my_counter = Counter.new

puts my_counter.count_clusters(input)
