poem = [
  "\"Hope\" is the thing with feathers -",
  "That perches in the soul -",
  "And sings the tune without the words -",
  "And never stopes - at all -",
]

greatest_length = 0
poem.each{|line|
  if greatest_length < line.length
    greatest_length = line.length
  end
}

line_width = greatest_length + 2

poem.each{|line|
  puts line.center(line_width)
}
puts "by Emily Dickinson".rjust(line_width)