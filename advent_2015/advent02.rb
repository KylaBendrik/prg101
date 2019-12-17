
def paper_needed(sides)
  l = sides[0]
  w = sides[1]
  h = sides[2]

  ((l * w) * 3) + ((h * w) * 2) + ((l * h) * 2)
end

def cycle_through(input)
  
  total_paper = 0

  array = input.lines

  pp array
  
  array.each do |expression|
    exp_arr = expression.split("x")
    x = exp_arr[0].to_i
    y = exp_arr[1].to_i
    z = exp_arr[2].to_i

    puts "x, y, z: #{x}, #{y}, #{z}"

    total_paper += paper_needed([x, y, z].sort)
  end
  puts total_paper
  # paper_needed([l, w, h].sort)
end

input = File.read('./input.txt')

cycle_through(input)