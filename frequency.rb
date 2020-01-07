# frozen_string_literal: true

input = File.read('./frequency_input.txt').downcase

# input is string of words: "dangsin-ege insa, chinjeol"
# split into array, getting rid of all punctuation:[dansin, ege, insa, chinjeol]
input = input.split /\W+/
puts input

CONSONANTS = %w[b c d f g h j k l m n p q r s t v w x z].freeze
VOWELS = %w[a e i o u y].freeze
CLUSTERS = %w[ng]

class Counter

  def char_type(this_char)
    if VOWELS.include?(this_char)
      :vowel
    else
      :consonant
    end
  end

  def count_clusters(array)
    clusters = Hash.new(0)
    new_cluster = []
    char_type = 'empty'

    array.each do |word|
      last_char_type = :empty
      current_char_type = :empty
      current_cluster = []

      word.chars.each_with_object(clusters) { |this_char, clusters| clusters[this_char] += 1 }

      word.chars.each_cons(2) do |pair|

        p pair

        if (first_type = char_type(pair[0])) == char_type(pair[1])
          if first_type == :vowel || CLUSTERS.include?(pair.join)
            submit(pair, clusters)
          end
        end
        # current_char_type = char_type(char)

        # # if we're at the beginning of the word, just add letter to cluster (A)
        # # if last letter is the same type as this letter, add letter to cluster (B)
        # # if last letter is different, submit cluster, start new cluster, add letter (C)
        # # if cluster.join == "ng", submit cluster, start new cluster, add letter (D)

        # p current_char_type
        # p current_cluster
        # if last_char_type != current_char_type
        #   if current_char_type == :consonant || current_cluster.join == 'ng'
        #   end
        #   current_cluster = []
        # end

        # current_cluster << char

        # last_char_type = current_char_type
        # current_char_type = :empty
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
