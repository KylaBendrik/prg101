# frozen_string_literal: true

def shuffle(u_list, s_list)
  unless u_list.empty?

    picked_card = u_list.sample # 4
    s_list.push(picked_card)

    new_list = []

    looking = true

    u_list.each do |card|
      if card == picked_card && looking
        looking = false
      else
        new_list.push(card)
      end
    end

    puts "u_list: #{ u_list }"
    puts "s_list: #{ s_list }"
    puts "picked_card: #{ picked_card }"
    puts "new_list: #{ new_list }"
    puts '-' * 30

    shuffle(new_list, s_list)
  end

  s_list
end

array_to_shuffle = [1, 1, 1, 2, 3, 4, 5]

shuffled_array = shuffle(array_to_shuffle, [])

puts shuffled_array
