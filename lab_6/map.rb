def cont_size(world, x, y)
  return 0 if world.dig(y,x) != 'land'

  world[y][x] = 'counted'

  boxes = [-1, 0, 1].repeated_permutation(2).to_a

  1 + boxes.map do |(dx, dy)|
    cont_size(world, x + dx, y + dy)
  end.max


end

def create_map(size)
  map = []
  types = ['land','water','water']
  size.times do 
    row = []
    size.times do 
      row.push(types.sample)
    end
    map.push(row)
  end 
  map[5][5] = 'land'
  map
end

def display_map(map)
  i = 0
  map.each do |row|
    display_row = ''
    row.each do |cell|
      if cell == 'land'
        display_row += 'M '
      else
        display_row += '_ '
      end
    end
    puts i.to_s + " - " + display_row
    i += 1
  end
end

# new_map = create_map(10)
# p new_map


world = [["land", "land", "water", "land", "water", "land", "water", "land", "land", "water"], ["land", "water", "water", "water", "water", "land", "land", "land", "water", "land"], ["water", "land", "land", "land", "land", "water", "land", "land", "land", "land"], ["water", "water", "land", "water", "water", "water", "water", "water", "water", "land"], ["water", "water", "land", "water", "land", "land", "water", "water", "land", "water"], ["land", "land", "land", "water", "water", "land", "land", "water", "land", "land"], ["water", "land", "water", "water", "water", "water", "water", "water", "land", "land"], ["land", "land", "water", "water", "land", "land", "land", "water", "water", "water"], ["land", "water", 
  "land", "water", "water", "water", "water", "land", "land", "land"], ["water", "water", "water", "water", "land", "land", "land", "water", "water", "water"]]

display_map(world)
puts cont_size(world, 5, 5)