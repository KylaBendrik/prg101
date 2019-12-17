# frozen_string_literal: true

puts 'Houses need electricity and water.'
puts 'People need food'
puts 'You will learn to balance these needs'
puts '-' * 25

puts 'Enter (R) to create a room.'

input = gets.chomp

class Room
  def initialize(size_x, size_y)
    @size_x = size_x
    @size_y = size_y
    @map = []

    x_counter = 0
    y_counter = 0
    content = :floor

    size_x.times do
      content = :wall if x_counter == 0 || x_counter == (size_x - 1)
      size_y.times do
        content = :wall if y_counter == 0 || y_counter == (size_x - 1)
        @map.push([x_counter, y_counter, content])
        y_counter += 1
      end
      x_counter += 1
    end
  end
  def new_window
    puts 'press (A) to move window counter clockwise, or (D) to move clockwise'
    input = gets.chomp
    while ['a', 'd'].include?(input.downcase)

      input = gets.chomp
    end
  end
end

def new_room(size_x, size_y)
  puts '┌' + ('──' * (size_x - 2)) + '┐'
  (size_y - 2).times do
    puts '│' + ('  ' * (size_x - 2)) + '│'
  end
  puts '└' + ('──' * (size_x - 2)) + '┘'
end

puts "\e[;H"
puts "hello"

puts "\e[10;10H"
puts "hello 2"

# while input.empty? == false
#   case input.downcase
#   when 'r'
#     room = Room.new(6,6)
#   when 'w'
#     room.new_window
#   end
#   input = gets.chomp
# end


