class ThisError < StandardError
end

class ThatError < StandardError
end

class TheOtherError < StandardError
end

def random_failure
  number = rand(0..2)
  if number == 0
    raise ThisError, "Whoops!"
  elsif number == 1
    raise ThatError, "Uh, oh!"
  elsif number == 2
    raise TheOtherError, "Oh, no!"
  end
end

begin
  random_failure
rescue ThisError => error
  puts "I caught this!"
rescue ThatError => error
  puts "I caught that!"
end