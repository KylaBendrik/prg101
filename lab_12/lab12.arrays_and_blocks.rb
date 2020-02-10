fruit_string = "boulder, apple, banana, peach, cow"

def spsj(string)
  array = string.split(', ')
  array.pop
  array.shift
  print array.join(', ')
end

spsj(fruit_string)