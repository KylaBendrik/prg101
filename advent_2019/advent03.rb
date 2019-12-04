require 'set'

class Wire
  attr_accessor :lines
  def initialize(input)
    @lines = Set.new
    @current_location = [0,0]
    puts "wire initialized!"
    #populate @lines with x,y coords using line(move)
    input.each do |move|
      puts "do line move"
      line(move)
    end
  end
  def line(move)
    # move should look like R10, L5, U2, D17
    direction = move[0,1]
    amount = move[1,5].to_i
    delta_x = 0
    delta_y = 0

    if direction == "R"
      delta_x = 1
    elsif direction == "L"
      delta_x = -1
    elsif direction == "U"
      delta_y = 1
    elsif direction == "D"
      delta_y = -1
    end

    amount.times do 
      @current_location = [(@current_location[0] + delta_x), (@current_location[1] + delta_y)]
      @lines.add(@current_location.dup)
    end
    puts "lines pushed"

    #display_lines
  end
  def display_lines
    @lines.each do |line|
      puts "[#{line[0]}, #{line[1]}]"
    end
  end
end

class Board
  attr_accessor :starting_coords
  @starting_coords = [0,0]
  def initialize(input1, input2)
    @wire1 = Wire.new(input1)
    @wire2 = Wire.new(input2)
  end
  def compare_lines
    lines1 = @wire1.lines
    lines2 = @wire2.lines

    num = 0

    inters = lines1.intersection(lines2)
    puts "intersections found: #{inters.length}"
    pp inters

    # lines1.each do |line|
    #   num += 1
    #   intersections.push(line) if lines2.include?(line)
    #   puts "intersections found: #{intersections.length}, lines checked: #{num} out of #{lines1.length}"
    # end

    
    min_distance = 100_000

    inters.each do |inter|
      distance = inter[0].abs + inter[1].abs
      min_distance = distance if distance < min_distance
      puts "distance to center: #{distance} ~ min distance = #{min_distance}"
    end

    puts "distances discovered"
    answer = 0

    inters.each do |inter|
      distance = inter[0].abs + inter[1].abs
      
      if distance == min_distance
        puts "This is the chosen one!"
        answer = distance
      end

    end
    answer
  end
end
base1 = "R98,U47,R26,D63,R33,U87,L62,D20,R33,U53,R51"
base2 = "U98,R91,D20,R16,D67,R40,U7,R15,U6,R7"
input1 = base1.split(',')
input2 = base2.split(',')

board = Board.new(input1, input2)
puts "board initialized!"

puts board.compare_lines
