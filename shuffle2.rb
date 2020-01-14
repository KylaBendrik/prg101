def create_deck(suits, max_num)
  deck = []
  suits.each do |suit|
    
    num = 1
    max_num.times do
      deck.push("#{suit}-#{num}")
      num += 1
    end
  end
  deck
end

def shuffle(array_to_shuffle)
  # split into two decks
  l_hand = array_to_shuffle[0..(array_to_shuffle.length / 2)]
  r_hand = array_to_shuffle - l_hand
  puts "L: #{l_hand}"
  puts "R: #{r_hand}"

  new_deck = []

  # pick 1-5 cards, put into array, subtract from each hand in turn
  
  while l_hand.length > 0
    l_picked_cards = pick_cards(l_hand)
    r_picked_cards = []
    if r_hand.length > 0
      r_picked_cards = pick_cards(r_hand)
    end
    new_deck = new_deck + l_picked_cards
    new_deck = new_deck + r_picked_cards

    l_hand = l_hand - l_picked_cards
    r_hand = r_hand - r_picked_cards
  end

  return new_deck
end

def pick_cards(hand)
  picked_cards = []
  if hand.length > 0
    if hand.length > 3
      max = 3
    else
      max = hand.length
    end
    picked_cards = hand[0..rand(1..max)]
    
    puts "picked: #{picked_cards}"
  end
  return picked_cards
end

array_to_shuffle = create_deck(%w[spades diamonds hearts clubs], 13)
puts ar1 = shuffle(array_to_shuffle)
puts ar2 = shuffle(ar1)