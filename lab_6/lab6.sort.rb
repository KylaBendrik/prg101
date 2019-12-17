# frozen_string_literal: true

def sort(some_array) # This 'wraps' recursive_sort
  recursive_sort(some_array, [])
end

def recursive_sort(unsorted_array, sorted_array)
  # find first word, add to sorted_array
  best_word = 'zz'
  bad_list = []
  unsorted_array.each do |word|
    best_word = word if word.downcase < best_word.downcase
  end

  unsorted_array.each do |word|
    bad_list.push(word) unless word == best_word
  end

  sorted_array.push(best_word)
  # put the rest back into unsorted_array
  print 'Sorted array: '
  p sorted_array

  recursive_sort(bad_list, sorted_array) unless bad_list.empty?
end

sort(%w[banana Pineapple mango cherry Turnip apple])
