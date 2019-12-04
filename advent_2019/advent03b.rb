class Wire
  attr_accessor :lines
  def initialize(input)
    @lines = []
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
      @lines.push(@current_location.dup)
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
  def length_to_intersections(intersections)
    distances = []
    lines1 = @wire1.lines
    lines2 = @wire2.lines

    intersections.each do |spot|
      #return index of lines1 and lines2 where they first get to intersection
      index1 = lines1.index(spot)
      index2 = lines2.index(spot)

      puts "distance to spot: #{index1 + index2}"

      distances.push([index1 + index2 + 2])
    end

    min = distances.min
    index_of_min = distances.index(min)

    puts min
  end

end

intersections = [[107, 71], [107, 51], [107, 47], [124, 11], [157, 18]]

base1 = "R98,U47,R26,D63,R33,U87,L62,D20,R33,U53,R51"
base2 = "U98,R91,D20,R16,D67,R40,U7,R15,U6,R7"
input1 = base1.split(',')
input2 = base2.split(',')

board = Board.new(input1, input2)
board.length_to_intersections(intersections)
puts "board initialized!"