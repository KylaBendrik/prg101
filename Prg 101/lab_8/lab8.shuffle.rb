# frozen_string_literal: true
class Array
  def shuffle # This 'wraps' recursive_shuffle
    recursive_shuffle(self, [])
  end
  
  def recursive_shuffle(unshuffled_array, shuffled_array)
    new_deck = []
    pick_a_card = rand(0..(unshuffled_array.length - 1))
    picked_card = unshuffled_array[pick_a_card]
  
    shuffled_array.push(picked_card)
  
    unshuffled_array.each do |card|
      new_deck.push(card) unless card == picked_card
    end
    print 'Shuffled Deck: '
    p shuffled_array
  
    recursive_shuffle(new_deck, shuffled_array) unless new_deck.empty?
  end
end


%w[apple banana cherry mango Pineapple Turnip].shuffle